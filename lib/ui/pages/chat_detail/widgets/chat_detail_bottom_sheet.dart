import 'package:flutter/material.dart';

class ChatDetailBottomSheet extends StatefulWidget {
  ChatDetailBottomSheet(this.bottomPadding);
  final double bottomPadding;

  @override
  State<ChatDetailBottomSheet> createState() => _ChatDetailBottomSheetState();
}

class _ChatDetailBottomSheetState extends State<ChatDetailBottomSheet> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSend() {
    print('온샌드 터치');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + widget.bottomPadding,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    //크기 지정되어야 함. Expanded로 감싸주기
                    controller: controller,
                    onSubmitted: (v) => onSend(),
                  ),
                ),
                GestureDetector(
                  onTap: onSend,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.send,
                      color: Theme.of(context).highlightColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: widget.bottomPadding,
          )
        ],
      ),
    );
  }
}
