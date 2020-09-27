class Profile {
  final String uid;
  final String email;
  final String name;
  final String userType;

  Profile({this.uid, this.email, this.name, this.userType});

  Map<String, dynamic> toMap() {
    return {'id': uid, 'email': email, 'name': name, 'userType': userType};
  }

  Profile.fromFirestore(Map<String, dynamic> firestore)
      : uid = firestore['id'],
        email = firestore['email'],
        name = firestore['name'],
        userType = firestore['userType'];

//  Map<String, dynamic> toJson(){
//    return{
//    'id' = uid,
//    'email' = email,
//    'name' = name,
//    'userType' = userType,
//    };
//  }

}
