import 'package:flutter/material.dart';

class ChatDetailProductArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey[300]!,
          )
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: 
      DefaultTextStyle(
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black, //컬러 입력 안 해주면 흰색.
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('아이폰 팝니다',),
          SizedBox(height: 2,),
          Text('2024.12.03',),
        ],),
      ),
    );
  }
}