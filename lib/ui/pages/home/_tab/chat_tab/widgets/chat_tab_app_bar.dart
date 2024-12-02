import 'package:flutter/material.dart';

class ChatTabAppBar extends StatelessWidget {
  const ChatTabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('채팅'),
    );
  }
}
