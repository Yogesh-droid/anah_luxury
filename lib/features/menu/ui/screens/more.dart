import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/menu/ui/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/profile_bloc/profile_bloc.dart';
import '../widgets/logged_out_profilepage_ui.dart';
import '../widgets/more_options.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileFetchedState) {
          return Container(
            color: white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  appDivider(),
                  ProfileCard(state.profileEntity),
                  appDivider(),
                  const MoreOptions()
                ],
              ),
            ),
          );
        } else {
          return Container(color: white, child: const LoggedOutProfilePageUi());
        }
      },
    );
  }
}
