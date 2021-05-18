import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';

class CreateRecipeStepTwoHeaderWidget extends StatelessWidget {
  final Function getChanges;
  CreateRecipeStepTwoHeaderWidget({
    required this.getChanges,
  });
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Column(
      children: <Widget>[
        const SizedBox(
          height: Dimensions.sxl * 3,
        ),
        const SizedBox(
          height: Dimensions.sxl * 1.5,
        ),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: CustomInputWidget(
            onChange: (value) => {getChanges(value)},
            change: true,
            // onChange: _onChanged,
            initialValue: '',
            validators: FormBuilderValidators.compose(
              [
                FormBuilderValidators.minLength(
                  context,
                  1,
                  errorText: strings.completeProfileScreenError,
                ),
              ],
            ),
            hint: strings.createRecipeAddRecipeName,
            attribute: 'recipeName',
            type: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
