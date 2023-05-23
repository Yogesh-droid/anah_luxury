import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/auth/login/ui/controllers/login_bloc/login_bloc.dart';
import 'package:anah_luxury/features/landing/ui/widgets/anah_auth_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/routes/routes.dart';
import '../controllers/password_visibility/password_visibility_cubit.dart';
import 'login_textfield.dart';

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length > 6;
  bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }
}

class LoginForm extends StatelessWidget with InputValidationMixin {
  LoginForm({super.key});

  static final _formKey = GlobalKey<FormState>();

  final TextEditingController emailTextField = TextEditingController();
  final TextEditingController passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print("Build");
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LoginTextField(
            isObscureText: false,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            textEditingController: emailTextField,
            onDone: (value) {
              _formKey.currentState!.validate();
            },
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
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                textEditingController: passwordTextField,
                onDone: (value) {
                  _formKey.currentState!.validate();
                },
                onValidate: (value) {
                  if (isPasswordValid(value!)) {
                    return null;
                  } else {
                    return 'Enter valid password';
                  }
                },
                suffix: InkWell(
                    onTap: () {
                      context
                          .read<PasswordVisibilityCubit>()
                          .changeVisibility();
                    },
                    child: Icon(
                      state ? Icons.visibility : Icons.visibility_off,
                      color: white,
                    )),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              style: getLoginButtonStyle(context),
              child: const Text(
                kForgot,
              ),
            ),
          ),
          AnahAuthButton(
            borderColor: white,
            title: kLogin.toUpperCase(),
            width: double.maxFinite,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(RequestLogin(
                        requestParams: RequestParams(
                            url: "${baseUrl}auth/login",
                            apiMethods: ApiMethods.post,
                            body: {
                          "email": emailTextField.text,
                          "password": passwordTextField.text
                        })));
                // }
              } else {
                return;
              }
            },
          ),
          const SizedBox(height: appWidgetGap),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: kDontHaveAcc,
                style: secMed15.copyWith(color: white.withOpacity(0.6))),
            const TextSpan(text: '  '),
            TextSpan(
                text: kSignUp,
                style: secMed15.copyWith(
                    color: white, fontWeight: FontWeight.w700),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.push(signPageRoute);
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

  ButtonStyle getLoginButtonStyle(BuildContext context) {
    return Theme.of(context).textButtonTheme.style!.copyWith(
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 8)),
        textStyle: MaterialStateProperty.all(
            secMed12.copyWith(foreground: Paint()..color = white)),
        overlayColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.pressed)
                ? white.withOpacity(0.10)
                : Colors.transparent),
        backgroundColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.pressed)
                ? white.withOpacity(0.10)
                : Colors.transparent),
        splashFactory: NoSplash.splashFactory);
  }
}
