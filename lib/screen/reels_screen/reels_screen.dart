import 'package:flutter/material.dart';
import 'package:reels_instagram/data/data.dart';
import 'package:reels_instagram/screen/reels_screen/reel_detal.dart';
import 'package:reels_instagram/screen/reels_screen/reels_side_acction_bar.dart';
import 'package:reels_instagram/screen/reels_screen/video_side_acction.dart';

class ReelsScrenn extends StatefulWidget {
  const ReelsScrenn({Key? key}) : super(key: key);

  @override
  _ReelsScrennState createState() => _ReelsScrennState();
}

class _ReelsScrennState extends State<ReelsScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Reels',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.photo_camera_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: reels.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                  child: Stack(
                children: [
                  VideoSideAcction(
                    reel: reels[index],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent
                    ], end: Alignment(0, -0.75), begin: Alignment(0, 0.1))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                              flex: 14,
                              child: ReelDetail(
                                reel: reels[index],
                              )),
                          Flexible(
                              flex: 2,
                              child: ReelSideAcctionBar(
                                reel: reels[index],
                              )),
                        ],
                      )
                    ],
                  )
                ],
              )),
            );
          }),
    );
  }
}
