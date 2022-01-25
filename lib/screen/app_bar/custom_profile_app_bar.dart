import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_instagram/screen/login/google_sign_state.dart';
import 'package:reels_instagram/screen/login/google_sign_state_notifier.dart';
import 'package:reels_instagram/screen/login/login_screnn.dart';

class CustomProfileAppBar extends StatelessWidget {
  CustomProfileAppBar({Key? key}) : super(key: key);
  final double _iconSize = 28;
  @override
  Widget build(BuildContext context) {
    final value = context.watch<GoogleSignState>();
    return SliverAppBar(
      pinned: true,
      centerTitle: false,
      title: GestureDetector(
        onTap: () => showBottomSheet(context),
        child: Row(
          children: [
            Text(
              value.googleSignInAccount!.displayName ?? '',
              maxLines: 1,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.expand_more),
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ],
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final value = Provider.of<GoogleSignState>(context, listen: false);
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        context: context,
        builder: (context) => Container(
            height: size.height / 4,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Icon(
                  Icons.minimize_outlined,
                  size: _iconSize,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: _iconSize,
                      backgroundImage: NetworkImage(
                          value.googleSignInAccount!.photoUrl ?? ''),
                    ),
                    title: Text(value.googleSignInAccount!.displayName ?? ''),
                    trailing: Icon(
                      Icons.adjust_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    onTap: () {
                      context.read<GoogleSignStateNotifier>().logout();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                          (route) => false);
                    },
                    leading: CircleAvatar(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white,
                      radius: _iconSize,
                      child: Icon(
                        Icons.add,
                        size: _iconSize,
                        color: Colors.black,
                      ),
                    ),
                    title: Text("Thêm tài khoản"),
                  ),
                )
              ],
            )));
  }
}
