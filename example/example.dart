import 'package:base32/base32.dart';

void main() {
  // Encode a hex string to base32
  base32.encodeHexString('48656c6c6f21deadbeef'); // -> 'JBSWY3DPEHPK3PXP'

  // base32 decoding to original string.
  base32.decode('JBSWY3DPEHPK3PXP'); // -> '48656c6c6f21deadbeef'
}
