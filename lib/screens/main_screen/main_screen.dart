import 'package:flutter/material.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/screens/main_screen/basket_screen.dart';
import 'package:watch_store_app/screens/main_screen/home_screen.dart';
import 'package:watch_store_app/screens/main_screen/profile_screen.dart';
import 'package:watch_store_app/widgets/btn_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          width: size.width,
          height: size.height * 0.1,
          color: AppColors.btmNavColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BtmNavActiveItem(
                iconPath: Assets.images.home,
                label: AppStrings.home,
                isActive: activeScreenIndex == 0,
                onTap: () => btnNavOnTap(0),
              ),
              BtmNavActiveItem(
                iconPath: Assets.images.cart,
                label: AppStrings.basket,
                isActive: activeScreenIndex == 1,
                onTap: () => btnNavOnTap(1),
              ),
              BtmNavActiveItem(
                iconPath: Assets.images.user,
                label: AppStrings.userProfile,
                isActive: activeScreenIndex == 2,
                onTap: () => btnNavOnTap(2),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: activeScreenIndex,
          children: [
            Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
            // HomeScreen(),
            const BasketScreen(),
            const ProfileScreen(),
          ],
        ),
      ),
    );
  }

  btnNavOnTap(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }
}
