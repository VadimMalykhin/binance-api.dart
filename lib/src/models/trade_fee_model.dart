import 'package:equatable/equatable.dart';

class TradeFeeModel extends Equatable {
  final String symbol;
  final double makerCommission;
  final double takerCommission;

  const TradeFeeModel({
    required this.symbol,
    required this.makerCommission,
    required this.takerCommission,
  });

  factory TradeFeeModel.fromJson(Map<String, dynamic> json) {
    return TradeFeeModel(
      symbol: json['symbol'],
      makerCommission: double.parse(json['makerCommission']),
      takerCommission: double.parse(json['takerCommission']),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['makerCommission'] = makerCommission;
    data['takerCommission'] = takerCommission;
    return data;
  }

  @override
  List<Object> get props => [symbol, makerCommission, takerCommission];

  @override
  bool get stringify => true;
}
