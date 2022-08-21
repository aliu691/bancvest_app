class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
  });

  //receiving from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
    );
  }

  //sending to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
