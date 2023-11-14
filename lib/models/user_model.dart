class UserModel {
  String name;
  String userImage;
  String email;
  String uid;

  UserModel({
    required this.email,
    required this.name,
    required this.uid,
    required this.userImage,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      userImage: map['userImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "name": name, "uid": uid, "userImage": userImage};
  }
}
