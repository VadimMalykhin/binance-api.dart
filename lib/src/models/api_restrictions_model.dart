import 'package:equatable/equatable.dart';

class ApiRestrictionsModel extends Equatable {
  final bool ipRestrict;
  final int createTime;
  final bool enableMargin;
  final bool enableFutures;
  final bool enableVanillaOptions;
  final bool enableReading;
  final bool enableSpotAndMarginTrading;
  final bool enableWithdrawals;
  final bool enableInternalTransfer;
  final bool permitsUniversalTransfer;

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
    return data;
  }

  @override
  List<Object> get props => [
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
      ];

  @override
  bool get stringify => true;
}
