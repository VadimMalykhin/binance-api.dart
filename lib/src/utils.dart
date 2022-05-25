import 'dart:convert' show utf8;

import 'package:convert/convert.dart' show hex;
import 'package:crypto/crypto.dart' show Hmac, sha256;

/// Create HMAC Signature
String createSignature({required String queryString, required String apiSecret}) {
  final messageBytes = utf8.encode(queryString);
  final key = utf8.encode(apiSecret);
  final hmac = Hmac(sha256, key);
  final digest = hmac.convert(messageBytes);
  return hex.encode(digest.bytes);
}
