import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

main() {
  setUp(() {});
  test('Email Reqexp', () {
    String email = "joedoe@gmail.com";
    expect(email.isValidEmail, true);
  });
}
