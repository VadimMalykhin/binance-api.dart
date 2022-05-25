library binance_api;

import 'src/client/http.dart';
import 'src/client/websocket.dart';
import 'src/mixins/mixins.dart';

export 'src/enums/enums.dart';
export 'src/exceptions/exceptions.dart';
export 'src/models/models.dart';

/// [BinanceApi]
abstract class BinanceApi {}

/// [BinanceApiSpot]
class BinanceApiSpot extends BinanceApi with CredentialsMixin, HttpClient, SpotMixin {}

/// [BinanceApiMargin]
class BinanceApiMargin extends BinanceApi with CredentialsMixin, HttpClient, MarginMixin {}

/// [BinanceApiFutures]
class BinanceApiFutures extends BinanceApi with CredentialsMixin, HttpClient, FuturesMixin {}

/// [BinanceApiWebSocket]
class BinanceApiWebSocket extends BinanceApi with CredentialsMixin, WebSocketClient, WebSocketMixin {}
