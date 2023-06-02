import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/auth/login/ui/controllers/login_bloc/login_bloc.dart';
import 'package:anah_luxury/features/landing/ui/widgets/anah_auth_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../login/ui/controllers/password_visibility/password_visibility_cubit.dart';
import '../../../login/ui/widgets/login_form.dart';
import '../../../login/ui/widgets/login_textfield.dart';

class SignUpForm extends StatelessWidget with InputValidationMixin {
  SignUpForm({super.key});

  static final _signUpformKey = GlobalKey<FormState>();

  final TextEditingController nameTextField = TextEditingController();
  final TextEditingController emailTextField = TextEditingController();
  final TextEditingController passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpformKey,
      child: Column(
        children: [
          LoginTextField(
            isObscureText: false,
            hintText: kYourName,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            textEditingController: nameTextField,
            onValidate: (value) {
              if (isNameValid(value!) || value.isNotEmpty) {
                return null;
              } else {
                return 'Name Should Containt Letters Only';
              }
            },
          ),
          const SizedBox(height: appFormFieldGap),
          LoginTextField(
            isObscureText: false,
            hintText: kEmailId,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            textEditingController: emailTextField,
            onValidate: (value) {
              if (isEmailValid(value!)) {
                return null;
              } else {
                return 'Enter valid email address';
              }
            },
          ),
          const SizedBox(height: appFormFieldGap),
          BlocBuilder<PasswordVisibilityCubit, bool>(
            builder: (context, state) {
              return LoginTextField(
                isObscureText: state,
                hintText: kSetPassword,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                textEditingController: passwordTextField,
                onValidate: (value) {
                  if (isPasswordValid(value!)) {
                    return null;
                  } else {
                    return 'Valid password should at least 6 character';
                  }
                },
              );
            },
          ),
          const SizedBox(height: appWidgetGap),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginSuccess) {
                Future.delayed(const Duration(seconds: 1), () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Account created successfully")));
                });
              } else if (state is LoginFailed) {
                Future.delayed(const Duration(seconds: 1), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.exception.toString())));
                });
              }
              return BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return AnahAuthButton(
                    borderColor: white,
                    title: state is SigningUp
                        ? "Signin up ..".toUpperCase()
                        : kSignUp.toUpperCase(),
                    width: double.maxFinite,
                    onTap: () {
                      if (state is SigningUp) {
                        return;
                      }
                      if (_signUpformKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(RequestSignUp(
                                requestParams: RequestParams(
                                    url: "${baseUrl}auth/signup",
                                    apiMethods: ApiMethods.post,
                                    body: {
                                  "name": nameTextField.text,
                                  "last_name": 'Kr',
                                  "email": emailTextField.text,
                                  "password": passwordTextField.text
                                })));
                      } else {
                        return;
                      }
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(height: appWidgetGap),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: kAlreadyHaveAcc,
                style: secMed15.copyWith(color: white.withOpacity(0.6))),
            const TextSpan(text: '  '),
            TextSpan(
                text: kLogin,
                style: secMed15.copyWith(
                    color: white, fontWeight: FontWeight.w700),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacement(loginPageRoute);
                  })
          ])),
          const SizedBox(height: appWidgetGap),
          const Divider(color: white),
          const SizedBox(height: appWidgetGap),
          // Text(kContinueWith,
          //     style: sec_med_15.copyWith(
          //         color: white.withOpacity(0.6), fontWeight: FontWeight.w600)),
          // const SocialLoginBtn()
        ],
      ),
    );
  }
}
