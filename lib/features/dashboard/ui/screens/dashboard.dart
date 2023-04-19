import 'package:anah_luxury/features/browse/ui/screens/search_page.dart';
import 'package:anah_luxury/features/cart/ui/screens/cart_page.dart';
import 'package:anah_luxury/features/dashboard/ui/controllers/cubit/bottom_nav_controller_cubit.dart';
import 'package:anah_luxury/features/home/ui/screens/home_page.dart';
import 'package:anah_luxury/features/more/ui/screens/more.dart';
import 'package:anah_luxury/features/wishlist/ui/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          color: Colors.black,
        ),
      ),
    ]);
  }

  Widget getPages() {
    const List<Widget> _pageList = [
      HomePage(),
      SearchPage(),
      Cart(),
      WishList(),
      More()
    ];
    return BlocBuilder<BottomNavControllerCubit, int>(
        builder: (context, state) {
      return _pageList[state];
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
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: kHome),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  activeIcon: Icon(Icons.search_rounded),
                  label: kBrowse),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  activeIcon: Icon(Icons.shopping_bag),
                  label: kBag),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  activeIcon: Icon(Icons.favorite_rounded),
                  label: kWishList),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  activeIcon: Icon(Icons.menu),
                  label: kMore),
            ]);
      },
    );
  }
}
