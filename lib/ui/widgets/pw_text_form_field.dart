import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/validator_util.dart';

class PwTextFormField extends StatelessWidget {
  PwTextFormField({
    required this.controller,
  });
  
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: '비밀번호를 입력해주세요'),
      obscureText: true,
      validator: ValidatorUtil.ValidatorPassword,
    );
  }
}