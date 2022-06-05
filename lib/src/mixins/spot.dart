import '../client/http.dart';
import '../endpoints.dart';
import '../exceptions/exceptions.dart';
import '../models/models.dart';
import 'credentials.dart';

mixin SpotMixin on HttpClient, CredentialsMixin {
  /// Test connectivity to the Rest API.
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#test-connectivity
  Future<bool> ping() async {
    try {
      await makeRequest('/v3/ping', Endpoint.api);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// Test connectivity to the Rest API and get the latency to the server.
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#test-connectivity
  Future<Stopwatch> pingLatency() async {
    final stopwatch = Stopwatch()..start();
    await makeRequest('/v3/ping', Endpoint.api);
    stopwatch.stop();
    return stopwatch;
  }

  /// Test connectivity to the Rest API and get the current server time.
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#check-server-time
  Future<DateTime> time() async {
    final response = await makeRequest('/v3/time', Endpoint.api);
    return DateTime.fromMillisecondsSinceEpoch(response['serverTime'], isUtc: true);
  }

  //=> ServerTimeModel.fromJson(await makeRequest('/v3/time', Endpoint.api));

  /// Current exchange trading rules and symbol information.
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#exchange-information
  Future<ExchangeInfoModel> exchangeInfo() async =>
      ExchangeInfoModel.fromJson(await makeRequest('/v3/exchangeInfo', Endpoint.api));

  /// Symbols List
  Future<SymbolListModel> symbolsList() async {
    final response = await makeRequest(
      '/composite/v1/public/marketing/symbol/list',
      Endpoint.bapi,
      headers: {'Referer': 'https://www.binance.com/'},
    );
    if (response['data'] != null) {
      return SymbolListModel.from(response['data'].map((x) => SymbolListElementModel.fromJson(x)), growable: false);
    }
    return SymbolListModel.empty();
  }

  //
  // https://www.binance.com/bapi/composite/v1/public/marketing/get-info
  // getInfo() {}

  // https://www.binance.com/bapi/capital/v2/public/capital/config/getAll?includeEtf=true
  // https://www.binance.com/bapi/capital/v2/public/capital/config/getAll?includeEtf=false

  /// Get All
  Future<AllModel> getAll({bool includeEtf = true}) async {
    final queryParameters = <String, dynamic>{'includeEtf': includeEtf};

    final response = await makeRequest(
      '/capital/v2/public/capital/config/getAll',
      Endpoint.bapi,
      queryParameters: queryParameters,
    );

    if (response['data'] != null) {
      return AllModel.from(response['data'].map((x) => AllElementModel.fromJson(x)), growable: false);
    }

    return AllModel.empty();
  }

  /// Get Asset Logo
  Future<AssetLogoModel> getAssetLogo() async {
    final response = await makeRequest('/asset/v1/public/asset/asset/get-asset-logo', Endpoint.bapi);

    if (response['data'] != null) {
      return AssetLogoModel.from(response['data'].map((x) => AssetLogoElementModel.fromJson(x)), growable: false);
    }

    return AssetLogoModel.empty();
  }

  /// Get All Asset
  Future<AllAssetModel> getAllAsset() async {
    final response = await makeRequest('/asset/v2/public/asset/asset/get-all-asset', Endpoint.bapi);

    if (response['data'] != null) {
      return AllAssetModel.from(response['data'].map((x) => AllAssetElementModel.fromJson(x)), growable: false);
    }

    return AllAssetModel.empty();
  }

  /// Get information of coins (available for deposit and withdraw) for user (USER_DATA).
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#all-coins-39-information-user_data
  Future<List<WalletModel>> wallet() async {
    final response = await makeRequest(
      '/v1/capital/config/getall',
      Endpoint.sapi,
      credentials: getCredentials(),
      addTimestamp: true,
    );
    return List<WalletModel>.from(response.map((x) => WalletModel.fromJson(x)));
  }

  /// Fetch trade fee (USER_DATA).
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#trade-fee-user_data
  Future<List<TradeFeeModel>> tradeFee({String? symbol, int? recvWindow}) async {
    final queryParameters = <String, dynamic>{};

    if (symbol != null) {
      queryParameters['symbol'] = symbol;
    }

    if (recvWindow != null) {
      if (recvWindow > 60000) {
        throw BinanceApiArgumentException('accountSnapshot() `recvWindow` argument must be less than 60000.', 300);
      }
      queryParameters['recvWindow'] = recvWindow;
    }

    final response = await makeRequest(
      '/v1/asset/tradeFee',
      Endpoint.sapi,
      queryParameters: queryParameters,
      credentials: getCredentials(),
    );
    return List<TradeFeeModel>.from(response.map((x) => TradeFeeModel.fromJson(x)), growable: false);
  }

  /// API Key Permission (USER_DATA)
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#get-api-key-permission-user_data
  Future<ApiRestrictionsModel> apiRestrictions() async => ApiRestrictionsModel.fromJson(await makeRequest(
        '/v1/account/apiRestrictions',
        Endpoint.sapi,
        credentials: getCredentials(),
        addTimestamp: true,
      ));

  /// Daily Account Snapshot (USER_DATA)
  ///
  /// type	      STRING	YES "SPOT", "MARGIN", "FUTURES"
  /// startTime	  LONG	  NO
  /// endTime	    LONG	  NO
  /// limit	      INT	    NO	min 5, max 30, default 5
  /// recvWindow	LONG	  NO
  /// timestamp	  LONG	  YES
  Future<dynamic> accountSnapshot({DateTime? startTime, DateTime? endTime, int? limit = 5, int? recvWindow}) async {
    final queryParameters = <String, dynamic>{'type': 'SPOT'};

    if (limit != null) {
      if (limit < 5 || limit > 30) {
        throw BinanceApiArgumentException('accountSnapshot() `limit` argument must be between 5 and 30.', 300);
      }
      queryParameters['limit'] = limit;
    }

    if (recvWindow != null) {
      if (recvWindow > 60000) {
        throw BinanceApiArgumentException('accountSnapshot() `recvWindow` argument must be less than 60000.', 300);
      }
      queryParameters['recvWindow'] = recvWindow;
    }

    final response = await makeRequest(
      '/v1/accountSnapshot',
      Endpoint.sapi,
      queryParameters: queryParameters,
      credentials: getCredentials(),
      addTimestamp: true,
    );

    if (response['snapshotVos'] != null) {}
  }

  /// Asset Detail (USER_DATA)
  ///
  /// https://binance-docs.github.io/apidocs/spot/en/#asset-detail-user_data
  Future<AssetDetailModel> assetDetail({String? symbol, int? recvWindow}) async {
    final queryParameters = <String, dynamic>{};

    if (recvWindow != null) {
      if (recvWindow > 60000) {
        throw BinanceApiArgumentException('accountSnapshot() `recvWindow` argument must be less than 60000.', 300);
      }
      queryParameters['recvWindow'] = recvWindow;
    }

    final response = await makeRequest(
      '/v1/asset/assetDetail',
      Endpoint.sapi,
      queryParameters: queryParameters,
      credentials: getCredentials(),
    );
    return AssetDetailModel.from(response).map((key, value) => MapEntry(key, AssetDetailEntryModel.fromJson(value)));
  }
}
