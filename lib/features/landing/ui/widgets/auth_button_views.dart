import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/routes/routes.dart';
import 'package:anah_luxury/features/landing/ui/widgets/anah_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<IconData> iconsList = [Icons.facebook, Icons.apple, Icons.android];

class AuthButtonViews extends StatelessWidget {
  const AuthButtonViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnahAuthButton(
            title: kLogin.toUpperCase(),
            borderColor: Colors.white,
            onTap: () {
              context.push(loginPageRoute);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AnahAuthButton(
            title: kCreateAcc.toUpperCase(),
            isFilled: true,
            fillColor: Colors.white,
            onTap: () => context.push(signPageRoute),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            kContinueWith,
            style: TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: iconsList
                .map((e) => IconButton(
                      icon: Icon(
                        e,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
