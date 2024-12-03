import 'package:flutter_market_app/data/repository/vworld_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final vworldRepo = VworldRepository();
  test(
    'VWorldRepository: findbyname test',
    () async {
      final result = await vworldRepo.findByName('온천동');
      expect(result.isEmpty, false);

      final result2 = await vworldRepo.findByName('asd');
      expect(result2.isEmpty, true);
    },
  );
  test(
    'VWorldRepository: findbyLatLng test',
    () async {
      final result = await vworldRepo.findByLating(35.2210076,129.0826365);
      print(result);
      expect(result.isEmpty, false);

      final result2 = await vworldRepo.findByLating(32.2210076,129.0826365);
      print(result2);
      expect(result2.isEmpty, true);
    },
  );
}
