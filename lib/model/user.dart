class UserDetail {
  String? email;
  String? photoUrl;
  String? displayName;
  UserDetail({
    this.email,
    this.photoUrl,
    this.displayName,
  });

  UserDetail.fromJson(Map<String, dynamic> json) {
    this.displayName = json['displayName'];
    this.photoUrl = json['photoUrl'];
    this.email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;

    return data;
  }
}
