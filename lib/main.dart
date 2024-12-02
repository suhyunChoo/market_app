import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/home/home_page.dart';
import 'package:flutter_market_app/ui/pages/join/join_page.dart';
import 'package:flutter_market_app/ui/pages/welcome/welcome_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        highlightColor: Colors.orange,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            backgroundColor: WidgetStatePropertyAll(Colors.orange),
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(50)),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          //텍스트필드가 변경될 때마다 실행될 함수
          border: MaterialStateOutlineInputBorder.resolveWith((states){
            //1.states Set안에 WidgetState.focused가 포함 되어있을 때
            if(states.contains(WidgetState.focused)){
              return OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color:  Colors.grey,
                  width: 2,
                )
              );
            }
            //2.states Set안에 WidgetState.error가 포함되어 있을 때
            if(states.contains(WidgetState.error)){
              return OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color:  Colors.red[100]!,
                  width: 2,
                )
              );
            }
            return OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color:  Colors.grey[300]!,
                  width: 1,
                )
              );
          }),
        ),
      ),
      //home: WelcomePage(),
      home: HomePage(),
    );
  }
}
