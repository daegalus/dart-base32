import 'package:test/test.dart';
import 'package:base32/base32.dart';
import 'package:convert/convert.dart';

void main() {
  group('[Decode]', () {
    test('JBSWY3DPEHPK3PXP -> 48656c6c6f21deadbeef', () {
      var decoded = base32.decode('JBSWY3DPEHPK3PXP');
      var decodedString = hex.encode(decoded);

      expect(decodedString.toString(), equals('48656c6c6f21deadbeef'));
    });

    test('JBSWY3DPEHPK3PXPF throws FormatException', () {
      expect(() => base32.decode('JBSWY3DPEHPK3PXPF'),
          throwsA(TypeMatcher<FormatException>()));
    });
  });

  group('[Encode]', () {
    test('48656c6c6f21deadbeef -> JBSWY3DPEHPK3PXP', () {
      var encoded = base32.encodeHexString('48656c6c6f21deadbeef');
      expect(encoded, equals('JBSWY3DPEHPK3PXP'));
    });
  });

  group('[RFC4648][Encode]', () {
    test('"" -> ""', () {
      var encoded = base32.encodeString('');
      expect(encoded, equals(''));
    });
    test('f -> MY======', () {
      var encoded = base32.encodeString('f');
      expect(encoded, equals('MY======'));
    });
    test('fo -> MZXQ====', () {
      var encoded = base32.encodeString('fo');
      expect(encoded, equals('MZXQ===='));
    });
    test('foo -> MZXW6===', () {
      var encoded = base32.encodeString('foo');
      expect(encoded, equals('MZXW6==='));
    });
    test('foob -> MZXW6YQ=', () {
      var encoded = base32.encodeString('foob');
      expect(encoded, equals('MZXW6YQ='));
    });
    test('fooba -> MZXW6YTB', () {
      var encoded = base32.encodeString('fooba');
      expect(encoded, equals('MZXW6YTB'));
    });
    test('foobar -> MZXW6YTBOI======', () {
      var encoded = base32.encodeString('foobar');
      expect(encoded, equals('MZXW6YTBOI======'));
    });
  });

  group('[RFC4648][Decode]', () {
    test('"" -> ""', () {
      var decoded = base32.decodeAsString('');
      expect(decoded, equals(''));
    });
    test('MY====== -> f', () {
      var decoded = base32.decodeAsString('MY======');
      expect(decoded, equals('f'));
    });
    test('MZXQ==== -> fo', () {
      var decoded = base32.decodeAsString('MZXQ====');
      expect(decoded, equals('fo'));
    });
    test('MZXW6=== -> foo', () {
      var decoded = base32.decodeAsString('MZXW6===');
      expect(decoded, equals('foo'));
    });
    test('MZXW6YQ= -> foob', () {
      var decoded = base32.decodeAsString('MZXW6YQ=');
      expect(decoded, equals('foob'));
    });
    test('MZXW6YTB -> fooba', () {
      var decoded = base32.decodeAsString('MZXW6YTB');
      expect(decoded, equals('fooba'));
    });
    test('MZXW6YTBOI====== -> foobar', () {
      var decoded = base32.decodeAsString('MZXW6YTBOI======');
      expect(decoded, equals('foobar'));
    });
  });
}
