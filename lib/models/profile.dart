class Profile {
  final String email;
  final String name;
  final String userType;

  Profile({this.email, this.name, this.userType});

  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name, 'userType': userType};
  }

  Profile.fromFirestore(Map<String, dynamic> firestore)
      : email = firestore['email'],
        name = firestore['name'],
        userType = firestore['userType'];
}
