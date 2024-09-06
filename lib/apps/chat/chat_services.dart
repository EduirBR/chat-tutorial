import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/apps/chat/models/message.dart';

class ChatService {
//get instance of firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
  Future<void> sendMessage(String receiverID, String message) async {
    //get current user info
    final String currentUserID = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email!;
    final Timestamp currentTime = Timestamp.now();

    // create new message
    MessageModel newMessage = MessageModel(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: currentTime);
    // construct chat room id for users (sorted to be unique)

    List<String> ids = [currentUserID, receiverID];
    ids.sort(); //this ensure the chatroomID is the same for any 2 people
    String chatroomID = ids.join('_');

    await _firestore
        .collection("chat_rooms")
        .doc(chatroomID)
        .collection("messages")
        .add(newMessage.toJson());
  }

//receive messages
  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatroomID = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatroomID)
        .collection("messages")
        .orderBy("timestamp")
        .snapshots();
  }
}
