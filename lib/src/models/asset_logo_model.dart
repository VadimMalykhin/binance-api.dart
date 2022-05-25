import 'package:equatable/equatable.dart';

typedef AssetLogoModel = List<AssetLogoElementModel>;

/// [AssetLogoElementModel]
///
/// https://www.binance.com/bapi/asset/v1/public/asset/asset/get-asset-logo
class AssetLogoElementModel extends Equatable {
  final String asset;
  final String pic;

  const AssetLogoElementModel({
    required this.asset,
    required this.pic,
  });

  factory AssetLogoElementModel.fromJson(Map<String, dynamic> json) {
    return AssetLogoElementModel(
      asset: json['asset'],
      pic: json['pic'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['asset'] = asset;
    data['pic'] = pic;
    return data;
  }

  @override
  List<Object> get props => [asset, pic];

  @override
  bool get stringify => true;
}
