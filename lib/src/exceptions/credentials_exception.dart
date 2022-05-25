import 'base_exception.dart';

/// Binance API Exception
///
/// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md
class BinanceApiCredentialsException extends BinanceApiBaseException {
  BinanceApiCredentialsException(String message, int code) : super(message, code);
}
