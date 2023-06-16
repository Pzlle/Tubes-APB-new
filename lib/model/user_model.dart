class UserModel{
  String? uid;
  String? namaasli;
  String? email;
  String? username;

  UserModel({this.uid, this.namaasli, this.email, this.username});

  // data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid: map['uid'],
      namaasli: map['namaasli'],
      email: map['email'],
      username: map['username'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return{
      'uid' : uid,
      'namaasli' : namaasli,
      'email' : email,
      'username' : username,
    };
  }
}