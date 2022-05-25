import 'package:equatable/equatable.dart';

///
/// ```json
/// {
///     "logoUrl": "https://bin.bnbstatic.com/image/admin_mgs_image_upload/20210831/30ca7211-2172-4f14-a1fc-e684b3513779.png",
///     "cnLink": "",
///     "trading": true,
///     "unit": "",
///     "plateType": "MAINWEB",
///     "test": 0,
///     "createTime": 1603080237000,
///     "reconciliationAmount": 0.0,
///     "freeUserChargeAmount": 1000000.0,
///     "isLedgerOnly": false,
///     "supportMarket": null,
///     "assetDigit": 8,
///     "seqNum": "0",
///     "tags": [
///         "defi",
///         "pos",
///         "BSC",
///         "Launchpad"
///     ],
///     //"isLegalMoney": false,
///     //"etf": false,
///     "chineseName": "Injective Protocol",
///     "feeRate": null,
///     "feeDigit": 8,
///     //"gas": null,
///     "enLink": "",
///     "freeAuditWithdrawAmt": 0.0,
///     //"assetName": "Injective Protocol",
///     "feeReferenceAsset": null,
///     "commissionRate": 0.0,
///     //"assetCode": "INJ",
///     //"id": "512",
///     //"fullLogoUrl": "https://bin.bnbstatic.com/image/admin_mgs_image_upload/20210831/30ca7211-2172-4f14-a1fc-e684b3513779.png"
/// }
/// ```
///

typedef AllAssetModel = List<AllAssetElementModel>;

/// [AllAssetElementModel]
///
/// https://www.binance.com/bapi/asset/v2/public/asset/asset/get-all-asset
class AllAssetElementModel extends Equatable {
  final int? id;
  final String? assetCode;
  final bool? isLegalMoney;
  final bool? etf;
  final List<String>? tags;
  final double? gas;
  final String? logoUrl;
  final String? fullLogoUrl;

  const AllAssetElementModel({
    this.id,
    this.assetCode,
    this.isLegalMoney,
    this.etf,
    this.tags,
    this.gas,
    this.logoUrl,
    this.fullLogoUrl,
  });

  factory AllAssetElementModel.fromJson(Map<String, dynamic> json) {
    return AllAssetElementModel(
      id: json['id'],
      assetCode: json['assetCode'],
      isLegalMoney: json['isLegalMoney'],
      etf: json['etf'],
      tags: json['tags'],
      gas: json['gas'],
      logoUrl: json['logoUrl'],
      fullLogoUrl: json['fullLogoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['assetCode'] = assetCode;
    data['isLegalMoney'] = isLegalMoney;
    data['etf'] = etf;
    data['tags'] = tags;
    data['gas'] = gas;
    data['logoUrl'] = logoUrl;
    data['fullLogoUrl'] = fullLogoUrl;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        assetCode,
        isLegalMoney,
        etf,
        tags,
        logoUrl,
        fullLogoUrl,
      ];

  @override
  bool get stringify => true;
}
