class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? image;

  UserModel({this.uid, this.name, this.email, this.password, this.image, this.phoneNumber});

  UserModel.fromData(Map<String, dynamic>? dataMap)
      : uid = dataMap!['id'],
        name = dataMap['name'],
        email = dataMap['email'],
        phoneNumber =dataMap['phoneNumber'],
        password = dataMap['password'],
        image = dataMap['image'];

  Map<String, dynamic> toData() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'image': image,

    };
  }
}
