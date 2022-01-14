import 'package:flutter/material.dart';
import 'package:reels_instagram/screen/bottom_bar/custom_bottom_bar.dart';
import 'package:reels_instagram/screen/pages/explore_screen.dart';
import 'package:reels_instagram/screen/pages/home_screen.dart';
import 'package:reels_instagram/screen/pages/profile_screen.dart';
import 'package:reels_instagram/screen/reels_screen/reels_screen.dart';
import 'package:reels_instagram/screen/pages/shop_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedPageIndex = 0;
  static const List<Widget> _appPages = [
    HomeScreen(),
    ExploreScreen(),
    ReelsScrenn(),
    ShopScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _appPages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomBar(
        selectPageIndex: _selectedPageIndex,
        onIconTap: _onIconTap,
      ),
    );
  }

  void _onIconTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
