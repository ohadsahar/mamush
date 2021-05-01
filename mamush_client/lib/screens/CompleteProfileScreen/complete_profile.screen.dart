import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momrecipes/bloc/auth/auth.bloc.dart';
import 'package:momrecipes/bloc/auth/auth.state.dart';
import 'package:momrecipes/bloc/user/user.bloc.dart';
import 'package:momrecipes/bloc/user/user.events.dart';
import 'package:momrecipes/bloc/user/user.state.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/user/user.dto.dart';
import 'package:momrecipes/screens/CompleteProfileScreen/LocalWidgets/bottom_sheet_handler.widget.dart';
import 'package:momrecipes/screens/CompleteProfileScreen/LocalWidgets/complete_profile_camera.widget.dart';
import 'package:momrecipes/screens/CompleteProfileScreen/LocalWidgets/complete_profile_title.widget.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app.screen.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';
import 'package:momrecipes/widgets/column_scroll_view.widget.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';
import 'package:momrecipes/widgets/loading.widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  late AuthBloc _authBloc;
  late UserBloc _userBloc;
  late File _image = File('');
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        return AppScreen(
          child: state is UserUpdateState
              ? ColumnScrollView(
                  child: Column(
                    children: <Widget>[
                      CompleteProfileTitleWidget(
                        title: strings.completeProfileScreenWhoCooking,
                      ),
                      CompleteProfileCameraWidget(
                        image: _image,
                        filePath: state.user.profilePicture != null
                            ? state.user.profilePicture!.filePath
                            : '',
                        modalBottomSheetMenu: _modalBottomSheetMenu,
                      ),
                      const SizedBox(
                        height: Dimensions.xl,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: FormBuilder(
                          key: _formKey,
                          child: CustomInputWidget(
                            initialValue: state.user.fullName,
                            validators: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.minLength(
                                  context,
                                  1,
                                  errorText: strings.completeProfileScreenError,
                                ),
                              ],
                            ),
                            hint: strings.completeProfileScreenFullName,
                            attribute: 'fullName',
                            type: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Dimensions.xxl * 1.25,
                      ),
                      AppButton(
                        width: Dimensions.getScreenFractionWidth(
                          context,
                          0.3,
                        ),
                        height:
                            Dimensions.getScreenFractionHeight(context, 0.07),
                        color: AppColors.appPrimaryColor,
                        onSubmit: _onSubmit,
                        text: strings.acceptButton,
                      ),
                    ],
                  ),
                )
              : LoadingWidget(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        _userBloc = BlocProvider.of<UserBloc>(context);
        _userBloc.add(UserEvents.getMe());
      },
    );
  }

  void _modalBottomSheetMenu() {
    final S strings = S.of(context);
    final String imageType = 'image';
    final String galleryType = 'gallery';
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          height: 125.0,
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: new Center(
              child: Column(
                children: <Widget>[
                  BottomSheetHandlerWidget(
                    getImage: getImage,
                    placeholder: strings.completeProfileScreenCamera,
                    type: imageType,
                  ),
                  const SizedBox(height: Dimensions.md),
                  BottomSheetHandlerWidget(
                    getImage: getImage,
                    placeholder: strings.completeProfileScreenGallery,
                    type: galleryType,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future getImage(String type) async {
    final pickedFile = await picker.getImage(
      source: type == 'gallery' ? ImageSource.gallery : ImageSource.camera,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(
          pickedFile.path,
        );
      }
    });
  }

  _onSubmit() {
    final bool isValid = _formKey.currentState!.saveAndValidate();
    if (isValid) {
      _authBloc = BlocProvider.of<AuthBloc>(context);
      _userBloc = BlocProvider.of<UserBloc>(context);
      final id = _authBloc.state is AuthRegisterSuccessState
          ? _authBloc.state.user.id
          : _userBloc.state.user.id;
      final phoneNumber = _authBloc.state is AuthRegisterSuccessState
          ? _authBloc.state.user.phoneNumber
          : _userBloc.state.user.phoneNumber;
      final UserDTO userDTO = new UserDTO(
        id: id,
        phoneNumber: phoneNumber,
        fullName: _formKey.currentState!.value['fullName'],
        profilePicture: _image.path,
      );
      _userBloc.add(
        UserEvents.update(
          userDTO,
        ),
      );
    }
  }
}
