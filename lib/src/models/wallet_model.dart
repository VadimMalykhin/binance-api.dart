import 'dart:convert';

import 'package:equatable/equatable.dart';

class NetworkListModel extends Equatable {
  final String? network;
  final String? coin;
  final String? name;

  const NetworkListModel({
    required this.network,
    required this.coin,
    required this.name,
  });

  factory NetworkListModel.fromJson(Map<String, dynamic> json) {
    return NetworkListModel(
      network: json['network'],
      coin: json['coin'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['network'] = network;
    data['coin'] = coin;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [network, coin, name];

  @override
  bool get stringify => true;
}

class WalletModel extends Equatable {
  final String coin;
  final String name;
  final bool isLegalMoney;
  final bool trading;
  final List<NetworkListModel>? networkList;

  const WalletModel({
    required this.coin,
    required this.name,
    required this.isLegalMoney,
    required this.trading,
    required this.networkList,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      coin: json['coin'],
      name: json['name'],
      isLegalMoney: json['isLegalMoney'],
      trading: json['trading'],
      networkList: List<NetworkListModel>.from(json['networkList'].map((x) => NetworkListModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coin'] = coin;
    data['name'] = name;
    data['isLegalMoney'] = isLegalMoney;
    data['trading'] = trading;
    // data['networkList'] = networkList.toString(); todo ?
    return data;
  }

  static Map<String, dynamic> toMap(WalletModel data) => {
        'coin': data.coin,
        'name': data.name,
        'isLegalMoney': data.isLegalMoney,
        'trading': data.trading,
        'networkList': data.networkList,
      };

  static String encode(List<WalletModel> data) => jsonEncode(
        data.map<Map<String, dynamic>>((x) => WalletModel.toMap(x)).toList(),
      );

  static List<WalletModel> decode(String data) =>
      (jsonDecode(data) as List<dynamic>).map<WalletModel>((x) => WalletModel.fromJson(x)).toList();

  @override
  List<Object?> get props => [coin, name, isLegalMoney, trading];

  @override
  bool get stringify => true;
}
