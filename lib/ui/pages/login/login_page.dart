import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_util.dart';
import 'package:flutter_market_app/ui/pages/home/home_page.dart';
import 'package:flutter_market_app/ui/pages/login/login_view_model.dart';
import 'package:flutter_market_app/ui/widgets/id_text_form_field.dart';
import 'package:flutter_market_app/ui/widgets/pw_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //빈공간 터치했을 때 키보드 내려가게
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Text(
                '안녕하세요!\n아이디와 비밀번호로 로그인해주세요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              IdTextFormField(controller: idController),
              SizedBox(
                height: 20,
              ),
              PwTextFormField(controller: pwController),
              SizedBox(
                height: 20,
              ),
              Consumer(builder: (context, ref, child) {
                return ElevatedButton(
                    onPressed: () async {
                      //밸리데이션 성공했을 때 로그인 요청
                      if (formKey.currentState?.validate() ?? false) {
                        final viewModel = ref.read(loginViewModel);
                        final loginResult = await viewModel.login(
                          password: pwController.text,
                          username: idController.text,
                        );
                        if (loginResult) {
                          //로그인 성공->홈페이지로 이동
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }), (route) {
                            //기존 네비게이터 스택에 남아있는 페이지들이 하나씩 route라는 인자로 넘어와서
                            //함수가 실행됨
                            //페이지 스택에 남길지 여부 리턴
                            return false;
                          });
                        } else {
                          //로그인 실패시 스낵바로 이동
                          SnackbarUtil.showSnackBar(
                              context, '아이디와 비밀번호를 확인해주세요');
                        }
                      }
                    },
                    child: Text('로그인'));
              })
            ],
          ),
        ),
      ),
    );
  }
}
