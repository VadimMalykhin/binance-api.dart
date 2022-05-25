import 'base_exception.dart';

/// Binance API Restrictions Exception
class BinanceApiRestrictionsException extends BinanceApiBaseException {
  BinanceApiRestrictionsException(String message, int code) : super(message, code);

  factory BinanceApiRestrictionsException.fromJson(Map<String, dynamic> json) {
    return BinanceApiRestrictionsException(json['msg'], json['code']);
  }
}
