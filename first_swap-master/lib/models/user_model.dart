class UserModel {
  String? uid;
  String? email;
  String? UserName;
  String? phoneN;
  String? FirstName;
  String? LastName;
  int? Rate;
  bool? Blacklist;

  UserModel(
      {this.uid,
      this.email,
      this.UserName,
      this.phoneN,
      this.FirstName,
      this.LastName,
      this.Rate,
      this.Blacklist});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      UserName: map['UserName'],
      phoneN: map['phoneN'],
      FirstName: map['FirstName'],
      LastName: map['LastName'],
      Rate: map['Rate'],
      Blacklist: map['Blacklist'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'UserName': UserName,
      'phoneN': phoneN,
      'FirstName': FirstName,
      'LastName': LastName,
      'Rate': Rate,
      'Blacklist': Blacklist,
    };
  }
}
