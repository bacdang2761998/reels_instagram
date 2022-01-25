import 'package:google_sign_in/google_sign_in.dart';
import 'package:reels_instagram/screen/login/google_sign_state.dart';
import 'package:state_notifier/state_notifier.dart';

class GoogleSignStateNotifier extends StateNotifier<GoogleSignState>
    with LocatorMixin {
  GoogleSignStateNotifier() : super(GoogleSignState());

  final googleSignIn = GoogleSignIn();
  signIn() async {
    state = GoogleSignState(googleSignInAccount: await googleSignIn.signIn());
  }

  logout() async {
    state =
        GoogleSignState(googleSignInAccount: await googleSignIn.disconnect());
  }
}
