import 'package:flutter/material.dart';

class ProductDetailPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //페이지뷰 감싸는 부모 위젯의 크기 있어야 함.
    return SizedBox(
      height: 500,
      child: PageView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
