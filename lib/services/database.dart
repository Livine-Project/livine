import 'package:app/models/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  final String identifier;
  DatabaseService({ this.uid , this.identifier});

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('user');

  Future<void> updateUserData(String name, int age, String email) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'age': age,
      'email': email,
    });
  }
//  List<UserProfile> _userProfileFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc){
//      //print(doc.data);
//      return UserProfile(
//          name: doc.data['name'] ?? '',
//          age: doc.data['age'] ?? 0,
//      );
//    }).toList();
//  }
//
//  // get brews stream
//  Stream<List<UserProfile>> get profile {
//    return userCollection.snapshots()
//        .map(_userProfileFromSnapshot);
//  }
}