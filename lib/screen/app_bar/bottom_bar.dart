import 'package:flutter/material.dart';
import 'package:reels_instagram/screen/login/sign_in_state.dart';
import 'package:reels_instagram/screen/pages/explore_screen.dart';
import 'package:reels_instagram/screen/pages/home_screen.dart';
import 'package:reels_instagram/screen/pages/profile_screen.dart';
import 'package:reels_instagram/screen/pages/shop_screen.dart';
import 'package:reels_instagram/screen/reels_screen/reels_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  static List<Widget> _appPages = [
    HomeScreen(),
    ExploreScreen(),
    ReelsScrenn(),
    ShopScreen(),
    ProfileScreen(),
  ];
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final double _iconSize = 15;
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final value = context.watch<SignInState>();
    return Scaffold(
      body: Center(
        child: BottomBarScreen._appPages[_selectedPageIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedPageIndex == 2 ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                color: _selectedPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  _onIconTap(0);
                },
                icon: Icon(_selectedPageIndex == 0
                    ? Icons.home
                    : Icons.home_outlined)),
            IconButton(
                color: _selectedPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  _onIconTap(1);
                },
                icon: Icon(_selectedPageIndex == 1
                    ? Icons.search
                    : Icons.search_outlined)),
            IconButton(
                color: _selectedPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  _onIconTap(2);
                },
                icon: Icon(_selectedPageIndex == 2
                    ? Icons.settings_outlined
                    : Icons.settings_display_outlined)),
            IconButton(
                color: _selectedPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  _onIconTap(3);
                },
                icon: Icon(_selectedPageIndex == 3
                    ? Icons.local_mall
                    : Icons.local_mall_outlined)),
            InkWell(
              onTap: () {
                _onIconTap(4);
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: _iconSize,
                backgroundImage: NetworkImage(value.userDetail?.photoUrl ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onIconTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
