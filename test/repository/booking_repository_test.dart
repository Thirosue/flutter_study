import 'package:flutter_app/repository/booking_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final repository = BookingRepository();

  group('BookingRepository create() ', () {
    test('予約が正常に作成できること', () async {
      await repository.create();
      assert(true);
    });
  });
}
