import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('UserRepositiry: login test', ()async{
    final userRepo = UserRepository();
    final result1 = await userRepo.login(username: '1111',password: '1111');
    expect(result1, false);

    final result2 = await userRepo.login(username: '1111',password: '1111');
    expect(result2, false);
  });
}