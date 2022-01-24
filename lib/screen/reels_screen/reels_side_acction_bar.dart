import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reels_instagram/model/reel.dart';

class ReelSideAcctionBar extends StatelessWidget {
  ReelSideAcctionBar({Key? key, required this.reel}) : super(key: key);
  final double _iconSize = 28;
  final Reel reel;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
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
                  fit: BoxFit.cover, image: NetworkImage(user!.photoURL!))),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
