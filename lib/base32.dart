library base32;

import 'dart:typed_data';
import 'dart:convert';
import 'package:convert/convert.dart';

// ignore: camel_case_types
class base32 {
  /// Takes in a [byteList] converts it to a Uint8List so that I can run
  /// bit operations on it, then outputs a [String] representation of the
  /// base32.
  static String encode(Uint8List bytesList) {
    var i = 0;
    var count = (bytesList.length ~/ 5) * 5;
    var base32str = '';
    while (i < count) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i++];
      var v3 = bytesList[i++];
      var v4 = bytesList[i++];
      var v5 = bytesList[i++];

      base32str += _base32Chars[v1 >> 3] +
          _base32Chars[(v1 << 2 | v2 >> 6) & 31] +
          _base32Chars[(v2 >> 1) & 31] +
          _base32Chars[(v2 << 4 | v3 >> 4) & 31] +
          _base32Chars[(v3 << 1 | v4 >> 7) & 31] +
          _base32Chars[(v4 >> 2) & 31] +
          _base32Chars[(v4 << 3 | v5 >> 5) & 31] +
          _base32Chars[v5 & 31];
    }

    var remain = bytesList.length - count;
    if (remain == 1) {
      var v1 = bytesList[i];
      base32str +=
          _base32Chars[v1 >> 3] + _base32Chars[(v1 << 2) & 31] + '======';
    } else if (remain == 2) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i];
      base32str += _base32Chars[v1 >> 3] +
          _base32Chars[(v1 << 2 | v2 >> 6) & 31] +
          _base32Chars[(v2 >> 1) & 31] +
          _base32Chars[(v2 << 4) & 31] +
          '====';
    } else if (remain == 3) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i++];
      var v3 = bytesList[i];
      base32str += _base32Chars[v1 >> 3] +
          _base32Chars[(v1 << 2 | v2 >> 6) & 31] +
          _base32Chars[(v2 >> 1) & 31] +
          _base32Chars[(v2 << 4 | v3 >> 4) & 31] +
          _base32Chars[(v3 << 1) & 31] +
          '===';
    } else if (remain == 4) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i++];
      var v3 = bytesList[i++];
      var v4 = bytesList[i];
      base32str += _base32Chars[v1 >> 3] +
          _base32Chars[(v1 << 2 | v2 >> 6) & 31] +
          _base32Chars[(v2 >> 1) & 31] +
          _base32Chars[(v2 << 4 | v3 >> 4) & 31] +
          _base32Chars[(v3 << 1 | v4 >> 7) & 31] +
          _base32Chars[(v4 >> 2) & 31] +
          _base32Chars[(v4 << 3) & 31] +
          '=';
    }
    return base32str;
  }

  /// Takes in a [hex] string, converts the string to a byte list
  /// and runs a normal encode() on it. Returning a [String] representation
  /// of the base32.
  static String encodeHexString(String b32hex) {
    return encode(Uint8List.fromList(hex.decode(b32hex)));
  }

  /// Takes in a [utf8string], converts the string to a byte list
  /// and runs a normal encode() on it. Returning a [String] representation
  /// of the base32.
  static String encodeString(String utf8string) {
    return encode(Uint8List.fromList(utf8.encode(utf8string)));
  }

  /// Takes in a [base32] string and decodes it back to a [String] in hex format.
  static String decodeAsHexString(String base32) {
    return hex.encode(decode(base32));
  }

  /// Takes in a [base32] string and decodes it back to a [String].
  static String decodeAsString(String base32) {
    return utf8.decode(decode(base32));
  }

  /// Takes in a [base32] string and decodes it back to a [Uint8List] that can be
  /// converted to a hex string using hex.encode() from dart:convert
  static Uint8List decode(String base32) {
    base32 = base32.toUpperCase();
    if (base32.isEmpty) {
      return Uint8List(0);
    }
    if (!_isValid(base32)) {
      throw FormatException('Invalid Base32 characters');
      //return Uint8List(8);
    }

    var length = base32.indexOf('=');
    if (length == -1) {
      length = base32.length;
    }

    var i = 0;
    var count = length >> 3 << 3;
    var bytes = <int>[];
    while (i < count) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      var v5 = _base32Decode[base32[i++]] ?? 0;
      var v6 = _base32Decode[base32[i++]] ?? 0;
      var v7 = _base32Decode[base32[i++]] ?? 0;
      var v8 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
      bytes.add((v4 << 4 | v5 >> 1) & 255);
      bytes.add((v5 << 7 | v6 << 2 | v7 >> 3) & 255);
      bytes.add((v7 << 5 | v8) & 255);
    }

    var remain = length - count;
    if (remain == 2) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
    } else if (remain == 4) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
    } else if (remain == 5) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      var v5 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
      bytes.add((v4 << 4 | v5 >> 1) & 255);
    } else if (remain == 7) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      var v5 = _base32Decode[base32[i++]] ?? 0;
      var v6 = _base32Decode[base32[i++]] ?? 0;
      var v7 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
      bytes.add((v4 << 4 | v5 >> 1) & 255);
      bytes.add((v5 << 7 | v6 << 2 | v7 >> 3) & 255);
    }
    return Uint8List.fromList(bytes);
  }

  static bool _isValid(String b32str) {
    if (b32str.length % 2 != 0 || !_base32Regex.hasMatch(b32str)) {
      return false;
    }
    return true;
  }

  static final _base32Regex = RegExp(r'^[A-Z2-7=]+$');
  static const _base32Chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
  static const _base32Decode = {
    'A': 0,
    'B': 1,
    'C': 2,
    'D': 3,
    'E': 4,
    'F': 5,
    'G': 6,
    'H': 7,
    'I': 8,
    'J': 9,
    'K': 10,
    'L': 11,
    'M': 12,
    'N': 13,
    'O': 14,
    'P': 15,
    'Q': 16,
    'R': 17,
    'S': 18,
    'T': 19,
    'U': 20,
    'V': 21,
    'W': 22,
    'X': 23,
    'Y': 24,
    'Z': 25,
    '2': 26,
    '3': 27,
    '4': 28,
    '5': 29,
    '6': 30,
    '7': 31
  };
}
