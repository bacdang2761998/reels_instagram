import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reels_instagram/data/user.dart';
part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  factory SignInState({
    UserDetail? userDetail,
  }) = _SignInState;
}
