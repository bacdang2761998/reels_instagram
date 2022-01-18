import 'package:flutter/material.dart';
import 'package:reels_instagram/data/data.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar(
      {Key? key, required this.selectPageIndex, required this.onIconTap})
      : super(key: key);
  final int selectPageIndex;
  final double _iconSize = 15;
  final Function onIconTap;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: selectPageIndex == 2 ? Colors.black : Colors.white,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                color: selectPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  onIconTap(0);
                },
                icon: Icon(
                    selectPageIndex == 0 ? Icons.home : Icons.home_outlined)),
            IconButton(
                color: selectPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  onIconTap(1);
                },
                icon: Icon(selectPageIndex == 1
                    ? Icons.search
                    : Icons.search_outlined)),
            IconButton(
                color: selectPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  onIconTap(2);
                },
                icon: Icon(selectPageIndex == 2
                    ? Icons.settings_outlined
                    : Icons.settings_display_outlined)),
            IconButton(
                color: selectPageIndex == 2 ? Colors.white : Colors.black,
                onPressed: () {
                  onIconTap(3);
                },
                icon: Icon(selectPageIndex == 3
                    ? Icons.local_mall
                    : Icons.local_mall_outlined)),
            InkWell(
              onTap: () {
                onIconTap(4);
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: _iconSize,
                backgroundImage: NetworkImage(currenUser.profileImageUrl),
              ),
            )
          ],
        ),
      ),
    );
  }
}
