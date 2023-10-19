

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/res/text_style.dart';

import '../res/color_schema.dart';

typedef OnValidation = dynamic Function(String? text);


class InputField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Iterable<String>? autofillHints;
  String? hint;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool? obscureText;
  final OnValidation? validator;
  final Function(String?)? onChange;
  final Function(String?)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLine;
  final int? maxLength;
  final bool readOnly;
  final bool? enable;
  InputField(
      {Key? key,
        this.enable,
        this.onFieldSubmitted,
        this.prefixIcon,
        this.suffixIcon,
        this.maxLength,
        this.onTap,
        this.hint = "",
        this.focusNode,
        this.controller,
        this.obscureText = false,
        this.readOnly = false,
        this.validator,
        this.onChange,
        this.textInputAction,
        this.keyboardType,
        this.maxLine,
        this.autofillHints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      autocorrect: true,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle().normal14w500.textColor(AppColor.black),
      maxLength: maxLength,
      cursorColor: AppColor.blackDark,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText!,

      maxLines: maxLine,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.name,
      onChanged: (val) {
        if (onChange != null) {
          onChange!(val);
        }
      },

      validator: (val) {
        if (validator != null) {
          return validator!(val);
        } else {
          return null;
        }
      },
      enabled: enable ?? true,
      decoration: InputDecoration(
        fillColor: AppColor.primary.withOpacity(0.05),
        filled: true,
        isDense: true,
        focusedErrorBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: AppColor.textFieldBorder,width: 1.5),

          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: AppColor.textFieldBorder,width: 1.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: AppColor.textFieldBorder,width: 1.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: AppColor.primary,width: 1.5,),
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: const TextStyle().normal16w400.textColor(AppColor.gray400),
      ),
    );
  }
}
