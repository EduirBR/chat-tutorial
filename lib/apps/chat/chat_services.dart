import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
//get instance of firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each user
        final user = doc.data();
        return user;
      }).toList();
    });
  }
//send message

//receive messages
}
