import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_datail/widgets/product_datail_actions.dart';
import 'package:flutter_market_app/ui/pages/product_datail/widgets/product_detail_body.dart';
import 'package:flutter_market_app/ui/pages/product_datail/widgets/product_detail_bottom_sheet.dart';
import 'package:flutter_market_app/ui/pages/product_datail/widgets/product_detail_picture.dart';

class ProductDatailPage extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    //safe Area 확인, Scaffold 사용되는 위치에서 호출해줘야 가지고 올 수 있다.
    //print(MediaQuery.of(context).padding.bottom);

    return Scaffold(
      appBar: AppBar(
        actions: [
          ProductDatailActions(),
        ],
      ),
      bottomSheet: ProductDetailBottomSheet(MediaQuery.of(context).padding.bottom),
      body: ListView(children: [
        ProductDetailPicture(),
        ProductDetailBody(),
      ],)
    );
  }

}

//25분 24초부터 들으면 됨