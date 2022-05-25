import 'package:equatable/equatable.dart';

/// [AssetDetailModel]
typedef AssetDetailModel = Map<String, dynamic>;

/// [AssetDetailEntryModel]
class AssetDetailEntryModel extends Equatable {
  final bool depositStatus;
  final String minWithdrawAmount;
  final String withdrawFee;
  final bool withdrawStatus;
  final String? depositTip;

  const AssetDetailEntryModel({
    required this.depositStatus,
    required this.minWithdrawAmount,
    required this.withdrawFee,
    required this.withdrawStatus,
    this.depositTip,
  });

  factory AssetDetailEntryModel.fromJson(Map<String, dynamic> json) {
    return AssetDetailEntryModel(
      depositStatus: json['depositStatus'],
      minWithdrawAmount: json['minWithdrawAmount'],
      withdrawFee: json['withdrawFee'],
      withdrawStatus: json['withdrawStatus'],
      depositTip: json['depositTip'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['depositStatus'] = depositStatus;
    data['minWithdrawAmount'] = minWithdrawAmount;
    data['withdrawFee'] = withdrawFee;
    data['withdrawStatus'] = withdrawStatus;
    data['depositTip'] = depositTip;
    return data;
  }

  @override
  List<Object?> get props => [
        minWithdrawAmount,
        depositStatus,
        withdrawFee,
        withdrawStatus,
        depositTip,
      ];

  @override
  bool get stringify => true;
}
