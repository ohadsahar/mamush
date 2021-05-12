import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:momrecipes/bloc/auth/auth.bloc.dart';
import 'package:momrecipes/bloc/auth/auth.events.dart';
import 'package:momrecipes/bloc/auth/auth.state.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/auth.dto.dart';
import 'package:momrecipes/screens/PhoneInput/LocalWidgets/phone_input_title.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app.screen.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';
import 'package:momrecipes/widgets/column_scroll_view.widget.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';
import 'package:momrecipes/widgets/loading.widget.dart';

class PhoneInputScreen extends StatelessWidget {
  late AuthBloc authBloc;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return AppScreen(
          child: state is AuthLoadingState
              ? LoadingWidget()
              : ColumnScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: Dimensions.xxl * 2,
                      ),
                      PhoneInputTitleWidget(),
                      const SizedBox(
                        height: Dimensions.xxl,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: FormBuilder(
                          key: _formKey,
                          onChanged: () => {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: {'phoneNumber': ''},
                          child: CustomInputWidget(
                            onChange: (value) => {},
                            validators: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.minLength(
                                  context,
                                  10,
                                  errorText: strings.phoneInputScreenError,
                                ),
                              ],
                            ),
                            attribute: 'phoneNumber',
                            hint: strings.phoneInputScreenInsertPhone,
                            type: TextInputType.number,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Dimensions.xxl * 2.5,
                      ),
                      AppButton(
                        width: Dimensions.getScreenFractionWidth(
                          context,
                          0.3,
                        ),
                        height:
                            Dimensions.getScreenFractionHeight(context, 0.07),
                        color: AppColors.appPrimaryColor,
                        onSubmit: () => _onSubmit(
                          context,
                        ),
                        text: strings.acceptButton,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  _onSubmit(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    final bool isValid = _formKey.currentState!.saveAndValidate();
    final AuthDTO authDTO =
        new AuthDTO(phoneNumber: _formKey.currentState!.value['phoneNumber']);

    if (isValid) {
      authBloc.add(
        AuthEvents.register(authDTO),
      );
    }
  }
}
