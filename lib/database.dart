import 'package:firebase_database/firebase_database.dart';
import 'user.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference addUser(User user) {
  var id = databaseReference.child('users/').push();
  id.set(user.toJson());
  return id;
}
