import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'google_sign_state.freezed.dart';

@freezed
abstract class GoogleSignState with _$GoogleSignState {
  factory GoogleSignState({GoogleSignInAccount? googleSignInAccount}) =
      _GoogleSignState;
}
