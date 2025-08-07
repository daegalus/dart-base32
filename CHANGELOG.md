# Changelog

v2.2.0

- Fix crockford padding handling (Thanks @jscholler)
- Update deps and clean up old dart stuff no longer necessary.
- Expose `isValid` to allow verification with booleans.

v2.1.3

- Add auto padding for padded Encodings when padding is not part of the string but should be, reduces errors thrown and it is common to share unpadded strings for padded encodings.

v2.1.2

- Added lowercase variant of the RFC4648 encoding for use in situations where needed. I don't recommend using it, as this is not standard and not part of the RFC4648 spec, so interoperability with other libraries can not be guaranteed.

v2.1.1

- Add handling of dashes in crockford variant.
  
v2.1.0

- Add support for base32Hex, crockford, z-base-32, and geohash variants

v2.0.0

- Release final nullsafe version
  
v2.0.0-nullsafety.1

- Remove convert dependency

v2.0.0-nullsafety.0

- Nullsafety

v1.1.2

- Linting

v1.1.1

- Fix broken pubspec.yaml

v1.1.0

- Reimplemented Decode and Encode to fix issue #7
- Decode now throws FormatException if you give it an invalide base32 string.
- added encodeString() to pass in generic strings
- added decodeAsString() to return straight string data
- added decodeAsHexString() to return a hex format string directly
- Use convert to do hex encoding/decoding.
- Add a lot more tests, primarily from the RF4648 test cases.

v1.0.4 & v1.0.3 & v1.0.2

- Some cleanup

v1.0.1

- Enable 2.0.0 final support

v1.0.0

- Merge pull request to fix List type and some readme formatting
- This has been stable for years, moving to 1.0.0. Will release 1.0.0+1 when Dart 2.0 goes stable.

v0.1.2

- Merge Pull Request to move most dependencies to dev_dependecies

v0.1.0 & v0.1.1wq

- Updates for Dart 1.0 readiness.

v0.0.8

- Fix crypto import in the test.

v0.0.7

- Fix for typed_data name change. Thanks to the pull requestor for bringing it to my attention and fixing it.

v0.0.6

- Fix for language changes.

v0.0.5

- Fix for language changes.

v0.0.4

- Fixes and changes for M3
- New hex to byte converter.

v0.0.3

- Made all functions static.

v0.0.2

- Fixed unittest dependency

v0.0.1

- Initial Documented Release
