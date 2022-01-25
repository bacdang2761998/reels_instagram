class User {
  final String uid;
  final String? email;
  final String? photoUrl;
  final String? displayName;
  User({
    required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });
}
