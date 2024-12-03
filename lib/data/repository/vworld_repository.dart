import 'package:dio/dio.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(
    //설정 안 할 시 실패 응답오면 throw 던져서 에러남.
    validateStatus: (status) => true,
  ));

  //이름으로 검색하는 기능
  //위도 경도로 검색하는 기능

  Future<List<String>> findByName(String query) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/search',
        queryParameters: {
          'request': 'search',
          'key': 'D50FFAC5-D1B2-3086-B203-48C2AAE9CB79',
          'query': query,
          'type': 'DISTRICT',
          'category': 'L4',
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final items = response.data['response']['result']['items'];
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          return '${item['title']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<String>> findByLating(double lat, double lng) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': 'D50FFAC5-D1B2-3086-B203-48C2AAE9CB79',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT(${lng} ${lat})',
          'geometry': false,
          'size': 100,
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final features = response.data['response']['result']['featureCollection']['features'];
        final featuresList = List.from(features);
        final iterable = featuresList.map((feat) {
          return '${feat['properties']['full_nm']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
