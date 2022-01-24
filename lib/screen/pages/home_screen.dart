import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reels_instagram/screen/app_bar/custom_home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [CustomHomeAppBar()],
    );
  }
}
