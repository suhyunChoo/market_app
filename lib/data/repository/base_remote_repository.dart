//추상클래스
//Dio 클라이언트 객체

import 'package:dio/dio.dart';

abstract class BaseRemoteRepository {

  Dio get client => _client;

  static Dio _client = Dio(BaseOptions(
    baseUrl: 'http://192.168.45.61:8080',
    //설정 안 할 시 실패 응답오면 throw 던져서 에러남.
    validateStatus: (status) => true,
  ),
  )..interceptors.add(interceptor);

  static AuthInterceptor interceptor = AuthInterceptor();
}

class AuthInterceptor extends Interceptor{

  String? bearerToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 반드시 부모 클래스의 onRequest 호출해줘야 함.
    if(bearerToken!=null){
      options.headers.addAll({
        'Authorization': bearerToken,
      });
    }
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //onResponse의 uri가 /login일때, 응답코드가 200일 때
    if(response.realUri.path=='/login' && response.statusCode ==200){
      final token = response.headers['Authorization'];
      bearerToken = token?.first;
      print('로그인 성공함 : $bearerToken');
    }
    //헤더의 Authorization 필드의 값을 bareToken에 저장
    // 반드시 부모 클래스의 onResponse 호출해줘야 함.
    super.onResponse(response, handler);
  }

}