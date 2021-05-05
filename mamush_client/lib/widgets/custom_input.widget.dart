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
  const CustomInputWidget({
    required this.hint,
    required this.attribute,
    required this.type,
    required this.validators,
    this.initialValue,
    this.autoFocus = true,
    this.prefixIcon,
  });
  @override
  Widget build(BuildContext context) {
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
          fontSize: Dimensions.xxl,
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
      style: TextStyle(
        color: Colors.white,
        fontSize: Dimensions.xl,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
