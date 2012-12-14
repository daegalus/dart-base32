*PLEASE NOTE: THERE IS A BREAKING API CHANGE IN v0.0.8+ .*
Due to a required change of the optional parameter syntax and requirements, I made all my optional paramaters named over having them positional. So you need to prepend the name of the parameter if you are using optional parameters. Please check the examples.

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
  base32: 0.1
```

directly from github:
```yaml
dependencies:
  uuid:
    git: https://github.com/Daegalus/dart-base32.git
```

```dart
#import('https://raw.github.com/Daegalus/dart-base32/master/lib/base32.dart'); //pulls it directly from github.
// OR
#import('package:base32/base32.dart'); //Uses the local one in ./packages/base32/lib/bas32.dart

var b32 = new base32();
```

Start encoding/decoding ...

```dart
// Encode a hex string to base32
b32.encodeHexString('48656c6c6f21deadbeef'); // -> 'JBSWY3DPEHPK3PXP'

// base32 decoding to original string.
b32.decode("JBSWY3DPEHPK3PXP"); // -> '48656c6c6f21deadbeef'

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
b32.encodeHexString('48656c6c6f21deadbeef'); // -> 'JBSWY3DPEHPK3PXP'
```

### base32.decode(String base32)

Decodes a base32 string back to its original byte values.

* `base32` - (String) The base32 string you wish to decode.

Returns `Uint8List` of the decoded data.

Example: Decode a base32 string, then output it in hex format

```dart
var decoded = b32.decode("JBSWY3DPEHPK3PXP");
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
v0.1
- Initial Documented Release
