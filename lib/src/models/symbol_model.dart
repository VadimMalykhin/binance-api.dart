import 'package:equatable/equatable.dart';

import 'models.dart';

///
class SymbolModel extends Equatable {
  final String symbol;
  final String status;
  final String baseAsset;
  final int baseAssetPrecision;
  final String quoteAsset;
  final int quotePrecision;
  final int quoteAssetPrecision;
  final List<String> orderTypes;
  final bool icebergAllowed;
  final bool ocoAllowed;
  final bool isSpotTradingAllowed;
  final bool isMarginTradingAllowed;
  final List<SymbolFilterModel> filters;
  final List<String> permissions;

  const SymbolModel({
    required this.symbol,
    required this.status,
    required this.baseAsset,
    required this.baseAssetPrecision,
    required this.quoteAsset,
    required this.quotePrecision,
    required this.quoteAssetPrecision,
    required this.orderTypes,
    required this.icebergAllowed,
    required this.ocoAllowed,
    required this.isSpotTradingAllowed,
    required this.isMarginTradingAllowed,
    required this.filters,
    required this.permissions,
  });

  factory SymbolModel.fromJson(Map<String, dynamic> json) => SymbolModel(
        symbol: json['symbol'],
        status: json['status'],
        baseAsset: json['baseAsset'],
        baseAssetPrecision: json['baseAssetPrecision'],
        quoteAsset: json['quoteAsset'],
        quotePrecision: json['quotePrecision'],
        quoteAssetPrecision: json['quoteAssetPrecision'],
        orderTypes: List.from(json['orderTypes']),
        icebergAllowed: json['icebergAllowed'],
        ocoAllowed: json['ocoAllowed'],
        isSpotTradingAllowed: json['isSpotTradingAllowed'],
        isMarginTradingAllowed: json['isMarginTradingAllowed'],
        filters: List<SymbolFilterModel>.from(json['filters'].map((x) => SymbolFilterModel.fromJson(x))),
        permissions: List.from(json['permissions']),
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['status'] = status;
    data['baseAsset'] = baseAsset;
    data['baseAssetPrecision'] = baseAssetPrecision;
    data['quoteAsset'] = quoteAsset;
    data['quotePrecision'] = quotePrecision;
    data['quoteAssetPrecision'] = quoteAssetPrecision;
    data['orderTypes'] = orderTypes;
    data['icebergAllowed'] = icebergAllowed;
    data['ocoAllowed'] = ocoAllowed;
    data['isSpotTradingAllowed'] = isSpotTradingAllowed;
    data['isMarginTradingAllowed'] = isMarginTradingAllowed;
    data['filters'] = filters;
    data['permissions'] = permissions;
    return data;
  }

  @override
  List<Object> get props => [
        symbol,
        status,
        baseAsset,
        baseAssetPrecision,
        quoteAsset,
        quotePrecision,
        quoteAssetPrecision,
        icebergAllowed,
        ocoAllowed,
        isSpotTradingAllowed,
        isMarginTradingAllowed,
        filters,
        permissions,
      ];

  @override
  bool get stringify => true;
}

/// "symbol": "ETHBTC",
/// "status": "TRADING",
/// "baseAsset": "ETH",
/// "baseAssetPrecision": 8,
/// "quoteAsset": "BTC",
/// "quotePrecision": 8,
/// "quoteAssetPrecision": 8,
/// "orderTypes": [
///    "LIMIT",
///    "LIMIT_MAKER",
///    "MARKET",
///    "STOP_LOSS",
///    "STOP_LOSS_LIMIT",
///    "TAKE_PROFIT",
///    "TAKE_PROFIT_LIMIT"
/// ],
/// "icebergAllowed": true,
/// "ocoAllowed": true,
/// "isSpotTradingAllowed": true,
/// "isMarginTradingAllowed": true,
// "filters": [
//    //These are defined in the Filters section.
//    //All filters are optional
// ],
/// "permissions": [
///     "SPOT",
///     "MARGIN"
/// ]
