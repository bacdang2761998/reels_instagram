import 'package:flutter/material.dart';
import 'package:reels_instagram/screen/app_bar/custom_profile_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [CustomProfileAppBar()],
    );
  }
}
