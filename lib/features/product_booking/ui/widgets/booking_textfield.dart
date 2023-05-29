import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookingTextField extends StatelessWidget {
  const BookingTextField(
      {super.key,
      this.hintText,
      this.focusNode,
      this.textEditingController,
      this.onDone,
      this.textInputType,
      this.maxLines,
      this.onValidate,
      this.prefix,
      this.suffix,
      this.isEnabled,
      this.textInputAction,
      this.onChange});
  final String? hintText;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final Function(String s)? onDone;
  final Function(String s)? onChange;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? Function(String? value)? onValidate;
  final Widget? prefix;
  final Widget? suffix;
  final bool? isEnabled;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      maxLength: maxLines,
      keyboardType: textInputType,
      enabled: isEnabled,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: black), gapPadding: 8),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: black), gapPadding: 8),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: black), gapPadding: 8),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: black), gapPadding: 8),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), gapPadding: 8),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        labelText: hintText,
        labelStyle: const TextStyle(color: black),
        prefix: prefix,
        suffix: suffix,
      ),
      onFieldSubmitted: onDone,
      validator: onValidate,
      onChanged: onChange,
      enableIMEPersonalizedLearning: true,
    );
  }
}
