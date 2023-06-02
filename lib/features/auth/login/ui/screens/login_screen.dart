import 'package:anah_luxury/core/constants/hive/local_storage.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/auth/login/ui/screens/login_background.dart';
import 'package:anah_luxury/features/auth/login/ui/screens/login_foreground.dart';
import 'package:anah_luxury/features/menu/ui/controllers/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../controllers/login_bloc/login_bloc.dart';

/// make login foreground and background
///
/// separate widget so that they donot build again and again on change configuration
///
/// text fields dont rebuild by doing this
///

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.exception.toString())));
          } else if (state is LoginSuccess) {
            debugPrint("token is =>=>=>=>  ${state.token}");
            LocalStorage.instance.token = state.token;
            debugPrint(
                "token from local storage is =>=>=>=>  ${LocalStorage.instance.token}");
            context.read<ProfileBloc>().add(GetProfileEvent());
            context.push(dashBoardRoute);
          }
        },
        builder: (context, state) {
          return Stack(
            children: const [LoginBackground(), LoginForeground()],
          );
        },
      ),
    );
  }
}
