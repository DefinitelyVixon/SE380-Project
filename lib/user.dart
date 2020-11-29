import 'package:firebase_database/firebase_database.dart';

class User{

  String userId;
  String userAccountName;
  DatabaseReference _id;

  User(this.userId, this.userAccountName);

  void setId(DatabaseReference id){
    this._id = id;
  }

  Map<String, dynamic> toJson(){
    return {
      'userId': this.userId,
      'userAccountName': this.userAccountName,
    };
  }
}
