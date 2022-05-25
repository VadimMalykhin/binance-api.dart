// "coin":"1INCH","de":true,"we":true,"dh":false,"wh":false,"name":"1inch","isLegal":false,"trading":true,"hot":0,"etf":false
import 'package:equatable/equatable.dart';

typedef AllModel = List<AllElementModel>;

/// [AllElementModel]
class AllElementModel extends Equatable {
  final String coin;
  final String name;
  final bool isLegal;
  final bool trading;
  final int hot;
  final bool etf;
  final bool de;
  final bool we;
  final bool dh;

  const AllElementModel({
    required this.coin,
    required this.name,
    required this.isLegal,
    required this.trading,
    required this.hot,
    required this.etf,
    required this.de,
    required this.we,
    required this.dh,
  });

  factory AllElementModel.fromJson(Map<String, dynamic> json) {
    return AllElementModel(
      coin: json['coin'],
      name: json['name'],
      isLegal: json['isLegal'],
      trading: json['trading'],
      hot: json['hot'],
      etf: json['etf'],
      de: json['de'],
      we: json['we'],
      dh: json['dh'],
    );
  }

  @override
  List<Object> get props => [coin, name, isLegal, trading, hot, etf, de, we, dh];

  @override
  bool get stringify => true;
}
