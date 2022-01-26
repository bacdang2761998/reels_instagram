import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_instagram/model/reel.dart';
import 'package:reels_instagram/screen/login/sign_in_state.dart';

class ReelSideAcctionBar extends StatelessWidget {
  ReelSideAcctionBar({Key? key, required this.reel}) : super(key: key);
  final double _iconSize = 28;
  final Reel reel;
  @override
  Widget build(BuildContext context) {
    final value = context.watch<SignInState>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          color: reel.isLiked ? Colors.red : Colors.white,
          onPressed: () {},
          icon: Icon(reel.isLiked ? Icons.favorite : Icons.favorite_outline),
          iconSize: _iconSize,
        ),
        Text(
          reel.totalLikes,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Icons.chat_bubble_outline),
          iconSize: _iconSize,
        ),
        Text(
          reel.totalComments,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Icons.send_outlined),
          iconSize: _iconSize,
        ),
        IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: _iconSize,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(value.userDetail?.photoUrl ?? ''))),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
