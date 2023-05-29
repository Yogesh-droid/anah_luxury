import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/product_booking/data/models/country_code_model.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/country_code_controller.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/booking_page_title_widget.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/strings.dart';
import '../../../auth/login/ui/widgets/login_form.dart';
import 'booking_textfield.dart';

class BookingWidget extends StatelessWidget with InputValidationMixin {
  BookingWidget(
      {super.key,
      required this.category,
      required this.bookingFormKey,
      required this.emailTextController,
      required this.nameTextController,
      required this.mobileNoTextcontroller,
      required this.lastNameController});
  final String category;
  final GlobalKey<FormState> bookingFormKey;
  final TextEditingController emailTextController;
  final TextEditingController nameTextController;
  final TextEditingController mobileNoTextcontroller;
  final TextEditingController lastNameController;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BookingPageTitleWidget(
              assetsPath: category == kCars
                  ? Assets.assetsBookingDriveIcon
                  : Assets.assetsBookingHouseTourIcon,
              title: category == kCars ? kBookTestDrive : kBookHouseTour,
              subtitle: category == kCars ? kGetBehindWheels : kStepInsideHome),
          const SizedBox(height: appWidgetGap),
          Padding(
              padding: const EdgeInsets.all(appPadding),
              child: Form(
                  key: bookingFormKey,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      BookingTextField(
                        textEditingController: nameTextController,
                        hintText: kFirstName,
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
                        textEditingController: lastNameController,
                        hintText: kLastName,
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
                        hintText: '$kEmailId*',
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
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const CountryCodePicker();
                                      });
                                },
                                child: BlocConsumer<CountryCodeController,
                                    CountryCodeModel>(
                                  listener: (context, state) {
                                    if (state.dialCode != null) {
                                      searchController.text = state.dialCode!;
                                    }
                                  },
                                  builder: (context, state) {
                                    return BookingTextField(
                                      textEditingController: searchController,
                                      isEnabled: false,
                                      hintText: "Code*",
                                      onDone: (value) {
                                        bookingFormKey.currentState!.validate();
                                      },
                                      textInputType: TextInputType.number,
                                      onValidate: (value) {
                                        if (isCountryCodeValid(value!)) {
                                          return null;
                                        } else {
                                          return "Incorrect Code";
                                        }
                                      },
                                    );
                                  },
                                ),
                              )),
                          const SizedBox(width: appPadding),
                          Expanded(
                            flex: 3,
                            child: BookingTextField(
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
                            ),
                          ),
                        ],
                      )
                    ]),
                  ))),
        ],
      ),
    );
  }
}
