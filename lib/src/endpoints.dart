// [Endpoint]
class Endpoint {
  static final Uri api = Uri(scheme: 'https', host: 'api.binance.com', path: 'api');
  static final Uri apiAlias1 = Uri(scheme: 'https', host: 'api1.binance.com', path: 'api');
  static final Uri apiAlias2 = Uri(scheme: 'https', host: 'api2.binance.com', path: 'api');
  static final Uri apiAlias3 = Uri(scheme: 'https', host: 'api3.binance.com', path: 'api');
  static final Uri bapi = Uri(scheme: 'https', host: 'www.binance.com', path: 'bapi');
  static final Uri dapi = Uri(scheme: 'https', host: 'dapi.binance.com', path: 'dapi');
  static final Uri fapi = Uri(scheme: 'https', host: 'fapi.binance.com', path: 'fapi');
  static final Uri sapi = Uri(scheme: 'https', host: 'api.binance.com', path: 'sapi');
  static final Uri wapi = Uri(scheme: 'https', host: 'api.binance.com', path: 'wapi');
  static final Uri ws = Uri(scheme: 'wss', host: 'stream.binance.com', port: 9443);

  Endpoint._();
}
