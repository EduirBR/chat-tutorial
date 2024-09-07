import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/apps/auth/auth_services.dart';
import 'package:myapp/apps/chat/chat_services.dart';
import 'package:myapp/apps/chat/widgets/chat_bubble.dart';
import 'package:myapp/shared/widgets/my_texfield.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  final String receiverEmail;
  final String receiverID;

  final TextEditingController _mesageController = TextEditingController();

  // services
  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();

  //send message
  void sendMessage() async {
    if (_mesageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _mesageController.text);
      _mesageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildUserInput()],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authServices.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
              children: snapshot.data!.docs
                  .map((doc) => _buildMessageItem(doc))
                  .toList());
        });
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser =
        data['senderID'] == _authServices.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.bottomLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data["message"], isCurrentUser: isCurrentUser),
          ],
        ));
  }

  //build message input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Expanded(
              child: MyTexField(
                  hintText: "Type a message", controller: _mesageController)),
          Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                  color: Colors.grey, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: sendMessage, icon: const Icon(Icons.send)))
        ],
      ),
    );
  }
}
