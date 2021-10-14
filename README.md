![Dart](https://github.com/Daegalus/dart-base32/workflows/Dart/badge.svg)

# dart-base32

Simple base32 encode/decode following RFC4648. Can handle base32 for OTP secrets also.

Features:

* Encodes and Decodes Base32 strings.
* [Annotated source code](https://daegalus.github.com/annotated/dart-base32/base32/base32.html)

## Getting Started

### Pubspec

pub.dev: (you can use 'any' instead of a version if you just want the latest always)

```yaml
dependencies:
  base32: 2.1.0
```

```dart
import 'package:base32/base32.dart';
```

Start encoding/decoding ...

```dart
// Encode a hex string to base32
base32.encodeHexString('48656c6c6f21deadbeef'); // -> 'JBSWY3DPEHPK3PXP'

// base32 decoding to original string.
base32.decodeAsHexString("JBSWY3DPEHPK3PXP"); // -> '48656c6c6f21deadbeef'
```

## API

### `base32.encode(List<int> byteList, {Encoding encoding = Encoding.standardRFC4648})`

Generate and return a RFC4648 base32 string from a list of bytes.

* `byteList` - (`List<int>`) A list of bytes representing your input.

Returns `String` representation of the encoded base32.

### `base32.encodeHexString(String hex, {Encoding encoding = Encoding.standardRFC4648})`

Generate and return a RFC4648 base32 string from a hex string.

* `hexString` - (`String`) A string of hex values intended to be converted to bytes and encoded.

Returns `String` representation of the encoded base32

Example: Encode a hex string.

```dart
base32.encodeHexString('48656c6c6f21deadbeef'); // -> 'JBSWY3DPEHPK3PXP'
```

### `base32.encodeString(String base32str, {Encoding encoding = Encoding.standardRFC4648})`

Generate and return a RFC4648 base32 string from a plain string.

* `base32str` - (`String`) A string intended to be converted to bytes and encoded.

Returns `String` representation of the encoded base32

Example: Encode a hex string.

```dart
base32.encodeString('foobar'); // -> 'MZXW6YTBOI======'
```

### `base32.decode(String base32, {Encoding encoding = Encoding.standardRFC4648})`

Decodes a base32 string back to its original byte values.

* `base32` - (`String`) The base32 string you wish to decode.

Returns `Uint8List` of the decoded data.

Example: Decode a base32 string, then output it in hex format

```dart
import "package:convert/convert.dart"
var decoded = base32.decode("JBSWY3DPEHPK3PXP");
var decodedHex = hex.encode(decoded); // -> '48656c6c6f21deadbeef'
```

### `base32.decodeAsHexString(String base32, {Encoding encoding = Encoding.standardRFC4648})`

Decodes a base32 string back to its original byte values in hex string format.

* `base32` - (`String`) The base32 string you wish to decode.

Returns `String` of the decoded data.

Example: Decode a base32 string to a hex string.

```dart
import "package:convert/convert.dart"
var decoded = base32.decodeAsHexString("JBSWY3DPEHPK3PXP"); // -> '48656c6c6f21deadbeef'
```

### `base32.decodeAsString(String base32, {Encoding encoding = Encoding.standardRFC4648})`

Decodes a base32 string back to its original byte values.

* `base32` - (`String`) The base32 string you wish to decode.

Returns `String` of the decoded data.

Example: Decode a base32 string to a string.

```dart
var decoded = base32.decodeAsString("MZXW6YTBOI======"); // -> 'foobar'
```

### `enum Encoding`

This is a list of supported variants and their different encodings.

- StandardRFC4658 - the default standard encoding
  - `ABCDEFGHIJKLMNOPQRSTUVWXYZ234567`
  - Padded with `=`
- base32Hex
  - `0123456789ABCDEFGHIJKLMNOPQRSTUV`
  - Padded with `=`
- crockford
  - `0123456789ABCDEFGHJKMNPQRSTVWXYZ`
  - Not Padded
- z-base-32
  - `ybndrfg8ejkmcpqxot1uwisza345h769`
  - Not Padded
- geohash
  - `0123456789bcdefghjkmnpqrstuvwxyz`
  - Padded with `=`
  
## Testing

```bash
dart test/base32_test.dart
```

## Changelog

See CHANGELOG.md
