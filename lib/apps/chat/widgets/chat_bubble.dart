import 'package:flutter/material.dart';
import 'package:myapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode
                  ? const Color.fromARGB(218, 100, 51, 51)
                  : const Color.fromARGB(218, 252, 148, 148))
              : (isDarkMode
                  ? Colors.grey
                  : const Color.fromARGB(255, 247, 245, 245)),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Text(
        message,
        style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black, fontSize: 18),
      ),
    );
  }
}
