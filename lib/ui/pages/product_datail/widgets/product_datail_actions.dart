import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_write/product_write_page.dart';

class ProductDatailActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ToDo 자신의 글이 아니면 보여주지 않기
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            print('삭제 버튼 터치됨');
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.delete),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ProductWritePage();
            },),);
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.edit),
          ),
        )
      ],
    );
  }
}
