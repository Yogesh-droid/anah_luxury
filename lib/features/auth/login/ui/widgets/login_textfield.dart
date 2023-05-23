import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      this.hintText,
      this.onChange,
      this.focusNode,
      this.textEditingController,
      this.onDone,
      this.textInputType,
      this.maxLines,
      required this.isObscureText,
      this.onValidate,
      this.prefix,
      this.suffix,
      this.textInputAction});
  final String? hintText;
  final Function(String s)? onChange;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final Function(String s)? onDone;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool isObscureText;
  final String? Function(String? value)? onValidate;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      focusNode: focusNode,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border:
            const UnderlineInputBorder(borderSide: BorderSide(color: white)),
        focusedBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: white)),
        disabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: white)),
        enabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: white)),
        labelText: hintText,
        labelStyle: const TextStyle(color: white),
        prefix: prefix,
        suffix: suffix,
      ),
      cursorColor: white,
      style: const TextStyle(color: white),
      textInputAction: textInputAction,
      // onChanged: onChange,
      onFieldSubmitted: onDone,
      maxLength: maxLines,
      obscureText: isObscureText,
      controller: textEditingController,
      validator: onValidate,
      enableIMEPersonalizedLearning: true,
    );
  }
}
