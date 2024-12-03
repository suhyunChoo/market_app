import 'package:geolocator/geolocator.dart';

class GeolocatorHelper {
  static Future<Position?> getPosition() async {
    //위치검색 권한 허용
    final permission = await Geolocator.checkPermission();
    //1.현재 권한이 허용되지 않았을 때 권한 요청
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
          //2.권한 요청 후 결과가 거부일 때 리턴
      final permission2 = await Geolocator.checkPermission();
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        return null;
      }
    }

    //3.geolocator로 위치 가져와서 리턴
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100, //몇미터 이동했을 때마다 값을 갱신
      )
    );
    return position;
  }
}
