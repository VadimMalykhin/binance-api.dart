import 'base_exception.dart';

/// Binance API Wallet Exception
class BinanceApiResponseException extends BinanceApiBaseException {
  BinanceApiResponseException(String message, int code) : super(message, code);

  factory BinanceApiResponseException.fromJson(Map<String, dynamic> json) {
    return BinanceApiResponseException(json['msg'], json['code']);
  }
}
