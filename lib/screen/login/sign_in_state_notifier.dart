import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reels_instagram/model/user.dart';
import 'package:reels_instagram/screen/login/sign_in_state.dart';
import 'package:state_notifier/state_notifier.dart';

class SignInStateNotifier extends StateNotifier<SignInState> with LocatorMixin {
  SignInStateNotifier() : super(SignInState());

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetail? userDetail;
  Map? userData;
  signInWithGoogle() async {
    googleSignInAccount = await googleSignIn.signIn();
    userDetail = new UserDetail(
      displayName: googleSignInAccount?.displayName,
      email: googleSignInAccount?.email,
      photoUrl: googleSignInAccount?.photoUrl,
    );
    state = SignInState(userDetail: userDetail);
  }

  signInWithFacebook() async {
    final result = await FacebookAuth.i.login(
      permissions: ['public_profile', 'email'],
    );

    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: 'email, name, picture',
      );
      userData = requestData;
      final newUser = new UserDetail(
        displayName: requestData['name'],
        email: requestData["email"],
        photoUrl: requestData['picture']['data']['url'],
      );
      state = state.copyWith(userDetail: newUser);
    }
  }

  logOut() async {
    googleSignInAccount = await googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    userData = null;
    state = state.copyWith(userDetail: null);
  }
}