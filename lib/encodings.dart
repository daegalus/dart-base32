class EncodingUtils {
  static String getChars(Encoding encoding) {
    return _encodeMap[encoding]!;
  }

  static Map<String, int> getDecodeMap(Encoding encoding) {
    var map = _decodeMap[encoding];
    if (map != null) {
      return map;
    } else {
      var chars = _encodeMap[encoding]!;
      // ignore: omit_local_variable_types
      Map<String, int> map = {};
      for (var i = 0; i < 32; i++) {
        map[chars[i]] = i;
      }
      _decodeMap[encoding] = map;
      return map;
    }
  }

  static RegExp getRegex(Encoding encoding) {
    return _regexMap[encoding]!;
  }

  static bool getPadded(Encoding encoding) {
    return _padded[encoding]!;
  }

  static final _regexMap = {
    Encoding.StandardRFC4648: RegExp(r'^[A-Z2-7=]+$'),
    Encoding.Base32Hex: RegExp(r'^[0-9A-V=]+$'),
    Encoding.Crockford: RegExp(r'^[0123456789ABCDEFGHJKMNPQRSTVWXYZ]+$'),
    Encoding.ZBase32: RegExp(r'^[ybndrfg8ejkmcpqxot1uwisza345h769]+$'),
    Encoding.Geohash: RegExp(r'^[0123456789bcdefghjkmnpqrstuvwxyz=]+$')
  };
  static final _encodeMap = {
    Encoding.StandardRFC4648: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567',
    Encoding.Base32Hex: '0123456789ABCDEFGHIJKLMNOPQRSTUV',
    Encoding.Crockford: '0123456789ABCDEFGHJKMNPQRSTVWXYZ',
    Encoding.ZBase32: 'ybndrfg8ejkmcpqxot1uwisza345h769',
    Encoding.Geohash: '0123456789bcdefghjkmnpqrstuvwxyz'
  };

  static final Map<Encoding, Map<String, int>> _decodeMap = {};

  static final _padded = {
    Encoding.StandardRFC4648: true,
    Encoding.Base32Hex: true,
    Encoding.Crockford: false,
    Encoding.ZBase32: false,
    Encoding.Geohash: true
  };
}

enum Encoding { StandardRFC4648, Base32Hex, Crockford, ZBase32, Geohash }
