import 'package:equatable/equatable.dart';

/// [SymbolListModel]
typedef SymbolListModel = List<SymbolListElementModel>;

/// [SymbolListElementModel]
class SymbolListElementModel extends Equatable {
  final int id;
  final int? rank;
  final String symbol;
  final String name;
  final String fullName;
  final String? localFullName;
  final String mapperName;
  final String logo;
  final String? slug;
  final int? cmcUniqueId;
  final double? marketCap;
  final double? volume;

  const SymbolListElementModel({
    required this.id,
    this.rank,
    required this.symbol,
    required this.name,
    required this.fullName,
    this.localFullName,
    required this.mapperName,
    required this.logo,
    this.slug,
    this.cmcUniqueId,
    this.marketCap,
    this.volume,
  });

  factory SymbolListElementModel.fromJson(Map<String, dynamic> json) {
    return SymbolListElementModel(
      id: json['id'],
      rank: json['rank'],
      symbol: json['symbol'],
      name: json['name'],
      fullName: json['fullName'],
      localFullName: json['localFullName'],
      mapperName: json['mapperName'],
      logo: json['logo'],
      slug: json['slug'],
      cmcUniqueId: json['cmcUniqueId'],
      marketCap: json['marketCap'],
      volume: json['volume'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['symbol'] = symbol;
    data['name'] = name;
    data['fullName'] = fullName;
    data['localFullName'] = localFullName;
    data['mapperName'] = mapperName;
    data['logo'] = logo;
    data['slug'] = slug;
    data['cmcUniqueId'] = cmcUniqueId;
    data['marketCap'] = marketCap;
    data['volume'] = volume;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        rank,
        symbol,
        name,
        fullName,
        localFullName,
        mapperName,
        logo,
        slug,
        cmcUniqueId,
        marketCap,
        volume,
      ];

  @override
  bool get stringify => true;
}
