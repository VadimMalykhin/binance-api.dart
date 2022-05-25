import 'package:equatable/equatable.dart';

import 'models.dart';

typedef RateLimits = List<RateLimitModel>;
typedef ExchangeFilter = String;

/// [ExchangeInfoModel]
///
/// https://binance-docs.github.io/apidocs/spot/en/#exchange-information
class ExchangeInfoModel extends Equatable {
  final String timezone;
  final DateTime serverTime;
  final RateLimits rateLimits;
  final List<ExchangeFilter> exchangeFilters;
  final List<SymbolModel> symbols;

  const ExchangeInfoModel({
    required this.timezone,
    required this.serverTime,
    required this.rateLimits,
    required this.exchangeFilters,
    required this.symbols,
  });

  factory ExchangeInfoModel.fromJson(Map<String, dynamic> json) {
    return ExchangeInfoModel(
      timezone: json['timezone'],
      serverTime: DateTime.fromMillisecondsSinceEpoch(json['serverTime'], isUtc: true),
      rateLimits: RateLimits.from(json['rateLimits'].map((x) => RateLimitModel.fromJson(x))),
      exchangeFilters: List<ExchangeFilter>.from(json['exchangeFilters']),
      symbols: List<SymbolModel>.from(json['symbols'].map((x) => SymbolModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['timezone'] = timezone;
    data['serverTime'] = serverTime;
    data['rateLimits'] = rateLimits;
    data['exchangeFilters'] = exchangeFilters;
    data['symbols'] = symbols;
    return data;
  }

  @override
  List<Object> get props => [timezone, serverTime, rateLimits, exchangeFilters, symbols];

  @override
  bool get stringify => true;
}
