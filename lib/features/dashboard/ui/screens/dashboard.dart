import 'package:anah_luxury/core/constants/assets.dart';
import 'package:anah_luxury/features/cars/ui/screens/cars_page.dart';
import 'package:anah_luxury/features/properties/ui/screens/properties_page.dart';
import 'package:anah_luxury/features/dashboard/ui/controllers/cubit/bottom_nav_controller_cubit.dart';
import 'package:anah_luxury/features/home/ui/screens/home_page.dart';
import 'package:anah_luxury/features/menu/ui/screens/more.dart';
import 'package:anah_luxury/features/saved/ui/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/strings.dart';
import '../widgets/anah_app_bar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getPages(),
      bottomNavigationBar: getBottomNavBar(),
    );
  }

  AnahAppBar getAppBar() {
    return const AnahAppBar(actions: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.notifications_outlined,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.search,
        ),
      ),
    ]);
  }

  Widget getPages() {
    const List<Widget> _pageList = [
      HomePage(),
      CarsPage(),
      PropertiesPage(),
      WishList(),
      More()
    ];
    return BlocBuilder<BottomNavControllerCubit, int>(
        builder: (context, state) {
      return IndexedStack(
        index: state,
        children: _pageList,
      );
    });
  }

  Widget getBottomNavBar() {
    return BlocBuilder<BottomNavControllerCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: state,
            enableFeedback: true,
            selectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey[700],
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.grey[600]),
            onTap: (value) {
              context.read<BottomNavControllerCubit>().changeIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.assetsBottomBarHome),
                  activeIcon:
                      SvgPicture.asset(Assets.assetsBottomBarHomeActive),
                  label: kHome),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.assetsBottomBarCar),
                  activeIcon:
                      SvgPicture.asset(Assets.assetsBottomBarCarActivie),
                  label: kCars),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.assetsBottomBarProperties),
                  activeIcon:
                      SvgPicture.asset(Assets.assetsBottomBarPropertiesActive),
                  label: kProperties),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.assetsBottomBarSaved),
                  activeIcon:
                      SvgPicture.asset(Assets.assetsBottomBarSaveAcitive),
                  label: kSaved),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.assetsBottomBarMenu),
                  activeIcon:
                      SvgPicture.asset(Assets.assetsBottomBarMenuActive),
                  label: kMenu),
            ]);
      },
    );
  }
}
