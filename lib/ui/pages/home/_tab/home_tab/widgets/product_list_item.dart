import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_datail/product_datail_page.dart';

class ProductListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //https://picsum.photos/200/300
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDatailPage();
        }));
      },
      child: Container(
        height: 120,
        //투명한 색상을 지정하면 컨테이너 눌렀을 때 제스처 디텍터 작동함
        color: Colors.transparent,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '아이폰 팝니다',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '온천동 1분전',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '100,000원',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        CupertinoIcons.heart,
                        size: 14,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
