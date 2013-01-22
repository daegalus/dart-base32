[![](https://drone.io/daegalus/dart-base32/status.png)](https://drone.io/daegalus/dart-base32/latest)

# dart-base32

Simple base32 encode/decode matching the base32 method used by Google Authenticator.

Features:

* Encodes and Decodes Base32 strings.
* [Annotated source code](http://daegalus.github.com/dart-base32/base32/base32.html)

## Getting Started

### Notes on Windows (currently)

* Use cmd for pub

### Pubspec

There are 2 options. Directly from git, or from pub.dartlang.org

pub.dartlang.org: (you can use 'any' instead of a version if you just want the latest always)
```yaml
dependencies:
  base32: 0.0.4
```

directly from github:
```yaml
dependencies:
  base32:
    git: https://github.com/Daegalus/dart-base32.git
```

```dart
#import('https://raw.github.com/Daegalus/dart-base32/master/lib/base32.dart'); //pulls it directly from github.
// OR
#import('package:base32/base32.dart'); //Uses the local one in ./packages/base32/lib/bas32.dart
```

Start encoding/decoding ...

```dart
// Encode a hex string to base32
base32.encodeHexString('48656c6c6f21deadbeef'); // -> 'JBSWY3DPEHPK3PXP'

// base32 decoding to original string.
base32.decode("JBSWY3DPEHPK3PXP"); // -> '48656c6c6f21deadbeef'
```

## API

### base32.encode(List byteList)

Generate and return a RFC4122 v1 (timestamp-based) UUID.

* `byteList` - (List) A list of bytes representing your input.

Returns `String` representation of the encoded base32.

### base32.encodeHexString(String hex)

Generate and return a RFC4122 v4 UUID.

* `hexString` - (String) A string of hex values intended to be converted to bytes and encoded.

Returns `String` representation of the encoded base32

Example: Encode a hex string.

```dart
base32.encodeHexString('48656c6c6f21deadbeef'); // -> 'JBSWY3DPEHPK3PXP'
```

### base32.decode(String base32)

Decodes a base32 string back to its original byte values.

* `base32` - (String) The base32 string you wish to decode.

Returns `Uint8List` of the decoded data.

Example: Decode a base32 string, then output it in hex format

```dart
var decoded = base32.decode("JBSWY3DPEHPK3PXP");
var decodedHex = CryptoUtils.bytesToHex(decoded); // -> '48656c6c6f21deadbeef'
```

## Testing

In dartvm

```
dart test\base32_test.dart
```

In Browser

At the moment, this package does not work client-side as it uses server-side only UInt8Lists. I might have to wait till UInt8Arrays and UInt8Lists are merged into 1

## Release notes
v0.0.4
- Fixes and changes for M3
- New hex to byte converter.
v0.0.3
- Made all functions static.
v0.0.2
- Fixed unittest dependency
v0.0.1
- Initial Documented Release
