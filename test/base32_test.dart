import 'package:unittest/unittest.dart';
import 'package:base32/base32.dart';
import 'dart:crypto';
import 'dart:scalarlist';

void main() {
  group('[Decode]', () {
    test('JBSWY3DPEHPK3PXP -> 48656c6c6f21deadbeef', () {
      var decoded = base32.decode("JBSWY3DPEHPK3PXP");
      var decodedString = CryptoUtils.bytesToHex(decoded);

      expect(decodedString.toString(), equals('48656c6c6f21deadbeef'));
    });
  });

  group('[Encode]', () {
    test('48656c6c6f21deadbeef -> JBSWY3DPEHPK3PXP', () {
      var decoded = base32.encodeHexString("48656c6c6f21deadbeef");
      expect(decoded, equals('JBSWY3DPEHPK3PXP'));
    });
  });
}
