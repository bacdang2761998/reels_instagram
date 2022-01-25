import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:reels_instagram/model/reel.dart';
import 'package:reels_instagram/screen/login/sign_in_state.dart';

class ReelDetail extends StatelessWidget {
  ReelDetail({Key? key, required this.reel}) : super(key: key);

  final Reel reel;
  @override
  Widget build(BuildContext context) {
    final value = context.watch<SignInState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 12,
          title: Row(
            children: [
              Text(value.userDetail!.displayName ?? ''),
              Text(
                ' - Follow',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(value.userDetail!.photoUrl ?? ''),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ExpandableText(
            reel.caption,
            style: TextStyle(
                fontSize: 12.5,
                color: Colors.white,
                fontWeight: FontWeight.w400),
            expandText: 'more',
            collapseText: 'lest',
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 1,
            linkColor: Colors.grey,
          ),
        ),
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 5,
          title: reel.isTagged
              ? Row(
                  children: [
                    Container(
                      height: 20,
                      width: 125,
                      child: Marquee(
                        text: '${reel.audioTitle} - ',
                        scrollAxis: Axis.horizontal,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              : Text(
                  reel.audioTitle,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
          leading:
              Icon(Icons.graphic_eq_outlined, size: 16, color: Colors.white),
        ),
      ],
    );
  }
}
