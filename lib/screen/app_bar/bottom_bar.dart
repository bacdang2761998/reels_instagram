import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reels_instagram/screen/pages/explore_screen.dart';
import 'package:reels_instagram/screen/pages/home_screen.dart';
import 'package:reels_instagram/screen/pages/profile_screen.dart';
import 'package:reels_instagram/screen/pages/shop_screen.dart';
import 'package:reels_instagram/screen/reels_screen/reels_screen.dart';

import 'custom_bottom_bar.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key, required this.user}) : super(key: key);
  final GoogleSignInAccount user;
  static List<Widget> _appPages = [
    HomeScreen(),
    ExploreScreen(),
    ReelsScrenn(),
    ShopScreen(),
    ProfileScreen()
  ];
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BottomBarScreen._appPages[_selectedPageIndex],
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
