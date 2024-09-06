import 'package:flutter/material.dart';
import 'package:myapp/apps/auth/auth_services.dart';
import 'package:myapp/apps/chat/chat_services.dart';
import 'package:myapp/apps/chat/pages/chat_page.dart';
import 'package:myapp/apps/main/widgets/user_tile.dart';
import 'package:myapp/shared/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) =>
                  _buildUserListItem(userData = userData, context = context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authServices.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // go to the user page

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        reciverEmail: userData["email"],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
