import 'package:equatable/equatable.dart';

class ApiRestrictionsModel extends Equatable {
  /// Restrict access to trusted IPs only.
  final bool ipRestrict;

  /// API Key create time.
  final int createTime;

  /// This option can be adjusted after the Cross Margin account transfer is completed.
  final bool enableMargin;

  /// API Key created before your futures account opened does not support futures API service.
  final bool enableFutures;

  /// Authorizes this key to Vanilla options trading.
  final bool enableVanillaOptions;

  /// This option enables reading.
  final bool enableReading;

  /// Spot and margin trading.
  final bool enableSpotAndMarginTrading;

  /// This option allows you to withdraw via API. You must apply the IP Access Restriction filter in order to enable withdrawals.
  final bool enableWithdrawals;

  /// This option authorizes this key to transfer funds between your master account and your sub account instantly.
  final bool enableInternalTransfer;

  /// Authorizes this key to be used for a dedicated universal transfer API to transfer multiple supported currencies.
  /// Each business's own transfer API rights are not affected by this authorization.
  final bool permitsUniversalTransfer;

  /// Expiration time for spot and margin trading permission.
  final int? tradingAuthorityExpirationTime;

  const ApiRestrictionsModel({
    required this.ipRestrict,
    required this.createTime,
    required this.enableMargin,
    required this.enableFutures,
    required this.enableVanillaOptions,
    required this.enableReading,
    required this.enableSpotAndMarginTrading,
    required this.enableWithdrawals,
    required this.enableInternalTransfer,
    required this.permitsUniversalTransfer,
    this.tradingAuthorityExpirationTime,
  });

  factory ApiRestrictionsModel.fromJson(Map<String, dynamic> json) {
    return ApiRestrictionsModel(
      ipRestrict: json['ipRestrict'],
      createTime: json['createTime'],
      enableMargin: json['enableMargin'],
      enableFutures: json['enableFutures'],
      enableVanillaOptions: json['enableVanillaOptions'],
      enableReading: json['enableReading'],
      enableSpotAndMarginTrading: json['enableSpotAndMarginTrading'],
      enableWithdrawals: json['enableWithdrawals'],
      enableInternalTransfer: json['enableInternalTransfer'],
      permitsUniversalTransfer: json['permitsUniversalTransfer'],
      tradingAuthorityExpirationTime: json['tradingAuthorityExpirationTime'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ipRestrict'] = ipRestrict;
    data['createTime'] = createTime;
    data['enableMargin'] = enableMargin;
    data['enableFutures'] = enableFutures;
    data['enableVanillaOptions'] = enableVanillaOptions;
    data['enableReading'] = enableReading;
    data['enableSpotAndMarginTrading'] = enableSpotAndMarginTrading;
    data['enableWithdrawals'] = enableWithdrawals;
    data['enableInternalTransfer'] = enableInternalTransfer;
    data['permitsUniversalTransfer'] = permitsUniversalTransfer;
    if (tradingAuthorityExpirationTime != null) data['tradingAuthorityExpirationTime'] = tradingAuthorityExpirationTime;
    return data;
  }

  @override
  List<Object?> get props => [
        ipRestrict,
        createTime,
        enableMargin,
        enableFutures,
        enableVanillaOptions,
        enableReading,
        enableSpotAndMarginTrading,
        enableWithdrawals,
        enableInternalTransfer,
        permitsUniversalTransfer,
        tradingAuthorityExpirationTime,
      ];

  @override
  bool get stringify => true;
}
