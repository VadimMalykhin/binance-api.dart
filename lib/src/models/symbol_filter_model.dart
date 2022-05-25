import 'package:equatable/equatable.dart';

class SymbolFilterModel extends Equatable {
  final String filterType;
  final num? tickSize;
  final num? minPrice;
  final num? maxPrice;
  final num? multiplierDown;
  final num? multiplierUp;
  final num? minNotional;
  final bool? applyToMarket;
  final int? avgPriceMins;
  final int? limit;
  final int? maxNumOrders;
  final int? maxNumAlgoOrders;
  final num? minQty;
  final num? maxQty;
  final num? stepSize;

  const SymbolFilterModel({
    required this.filterType,
    this.tickSize,
    this.minPrice,
    this.maxPrice,
    this.multiplierDown,
    this.multiplierUp,
    this.minNotional,
    this.applyToMarket,
    this.avgPriceMins,
    this.limit,
    this.maxNumOrders,
    this.maxNumAlgoOrders,
    this.minQty,
    this.maxQty,
    this.stepSize,
  });

  factory SymbolFilterModel.fromJson(Map<String, dynamic> json) {
    return SymbolFilterModel(
      filterType: json['filterType'],
      tickSize: num.tryParse(json['tickSize'] ?? ''),
      minPrice: num.tryParse(json['minPrice'] ?? ''),
      maxPrice: num.tryParse(json['maxPrice'] ?? ''),
      multiplierDown: num.tryParse(json['multiplierDown'] ?? ''),
      multiplierUp: num.tryParse(json['multiplierUp'] ?? ''),
      minNotional: num.tryParse(json['minNotional'] ?? ''),
      applyToMarket: json['applyToMarket'],
      avgPriceMins: json['avgPriceMins'],
      limit: json['limit'],
      maxNumOrders: json['maxNumOrders'],
      maxNumAlgoOrders: json['maxNumAlgoOrders'],
      minQty: num.tryParse(json['minQty'] ?? ''),
      maxQty: num.tryParse(json['maxQty'] ?? ''),
      stepSize: num.tryParse(json['stepSize'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['filterType'] = filterType;
    data['tickSize'] = tickSize;
    data['minPrice'] = minPrice;
    data['maxPrice'] = maxPrice;
    data['multiplierDown'] = multiplierDown;
    data['multiplierUp'] = multiplierUp;
    data['minNotional'] = minNotional;
    data['applyToMarket'] = applyToMarket;
    data['avgPriceMins'] = avgPriceMins;
    data['limit'] = limit;
    data['maxNumOrders'] = maxNumOrders;
    data['maxNumAlgoOrders'] = maxNumAlgoOrders;
    data['minQty'] = minQty;
    data['maxQty'] = maxQty;
    return data;
  }

  @override
  List<Object?> get props => [
        filterType,
        tickSize,
        minPrice,
        maxPrice,
        multiplierDown,
        multiplierUp,
        minNotional,
        applyToMarket,
        avgPriceMins,
        limit,
        maxNumOrders,
        maxNumAlgoOrders,
        minQty,
        maxQty,
      ];

  @override
  bool get stringify => true;
}
