class UserModel {
  String? uid;
  String? email;
  String? UserName;
  String? phoneN;
  String? FirstName;
  String? LastName;
  double? Rate;
  String? Rate1;
  String? Rate2;
  String? Rate3;
  String? Rate4;
  String? Rate5;
  String? NumRate;
  bool? Blacklist;
  String? token;

  UserModel(
      {this.uid,
      this.email,
      this.UserName,
      this.phoneN,
      this.FirstName,
      this.LastName,
      this.Rate,
      this.Rate1,
      this.Rate2,
      this.Rate3,
      this.Rate4,
      this.Rate5,
      this.NumRate,
      this.Blacklist,
      this.token});

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
      Rate1: map['rate1'],
      Rate2: map['rate2'],
      Rate3: map['rate3'],
      Rate4: map['rate4'],
      Rate5: map['rate5'],
      NumRate: map['NumRate'],
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
      'rate1': Rate1,
      'rate2': Rate2,
      'rate3': Rate3,
      'rate4': Rate4,
      'rate5': Rate5,
      'NumRate': Rate1,
      'Blacklist': Blacklist,
      'token': token,
    };
  }
}
