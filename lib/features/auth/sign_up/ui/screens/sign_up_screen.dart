import 'package:anah_luxury/features/auth/login/ui/controllers/login_bloc/login_bloc.dart';
import 'package:anah_luxury/features/auth/sign_up/ui/screens/sign_up_background.dart';
import 'package:anah_luxury/features/auth/sign_up/ui/screens/sign_up_foreground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/hive/local_storage.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../menu/ui/controllers/profile_bloc/profile_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SignUpFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.exception.toString())));
          } else if (state is SignUpSuccess) {
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
            children: const [
              SignUpBackground(),
              SignUpForeground(),
            ],
          );
        },
      ),
    );
  }
}
