import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class CustomInputWidget extends StatelessWidget {
  final String hint;
  final String attribute;
  final TextInputType type;
  final String? Function(String?) validators;
  final String? initialValue;
  final bool autoFocus;
  final Widget? prefixIcon;
  final bool? change;
  final onChange;
  const CustomInputWidget({
    required this.hint,
    required this.attribute,
    required this.type,
    required this.validators,
    this.initialValue,
    this.autoFocus = true,
    this.prefixIcon,
    this.change = false,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    //final ValueChanged _onChanged = (val) => print(val);

    return FormBuilderTextField(
      initialValue: initialValue,
      validator: validators,
      name: attribute,
      keyboardType: type,
      autofocus: autoFocus,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.all(
          Dimensions.xl * 1.25,
        ),
        hintText: hint,
        errorStyle: appTheme.textTheme.headline5,
        hintStyle: TextStyle(
          fontSize: Dimensions.sxl,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(
            Dimensions.sm,
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(
              Dimensions.sm,
            ),
          ),
        ),
        filled: true,
        fillColor: Color(0xff595A5A).withOpacity(
          0.49,
        ),
      ),
      onChanged: onChange,
      style: TextStyle(
        color: Colors.white,
        fontSize: Dimensions.sxl,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
