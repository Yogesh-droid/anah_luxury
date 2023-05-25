import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/auth/login/ui/widgets/login_form.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_textfield.dart';
import 'package:flutter/material.dart';

class BookingForm extends StatelessWidget with InputValidationMixin {
  BookingForm({super.key, required this.bookingFormKey});
  final GlobalKey<FormState> bookingFormKey;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController mobileNoTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: bookingFormKey,
        child: SingleChildScrollView(
          child: Column(children: [
            BookingTextField(
              textEditingController: nameTextController,
              hintText: kFullName,
              onDone: (value) {
                bookingFormKey.currentState!.validate();
              },
              textInputType: TextInputType.name,
              onValidate: (value) {
                if (isNameValid(value!)) {
                  return null;
                } else {
                  return "Name Must have at least three letters";
                }
              },
            ),
            const SizedBox(height: appPadding),
            BookingTextField(
              textEditingController: emailTextController,
              hintText: kEmailId,
              onDone: (value) {
                bookingFormKey.currentState!.validate();
              },
              textInputType: TextInputType.emailAddress,
              onValidate: (value) {
                if (isEmailValid(value!)) {
                  return null;
                } else {
                  return "Enter correct email-id";
                }
              },
            ),
            const SizedBox(height: appPadding),
            BookingTextField(
              textEditingController: mobileNoTextcontroller,
              hintText: kMobileNo,
              onDone: (value) {
                bookingFormKey.currentState!.validate();
              },
              textInputType: TextInputType.number,
              onValidate: (value) {
                if (isMobileValid(value!)) {
                  return null;
                } else {
                  return "Enter correct mobile no";
                }
              },
            )
          ]),
        ));
  }
}
