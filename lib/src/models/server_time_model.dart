import 'package:equatable/equatable.dart';

/// [ServerTimeModel]
///
/// https://binance-docs.github.io/apidocs/spot/en/#check-server-time
class ServerTimeModel extends Equatable {
  final DateTime serverTime;

  const ServerTimeModel({
    required this.serverTime,
  });

  factory ServerTimeModel.fromJson(Map<String, dynamic> json) {
    return ServerTimeModel(
      serverTime: DateTime.fromMillisecondsSinceEpoch(json['serverTime'], isUtc: true),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['serverTime'] = serverTime;
    return data;
  }

  @override
  List<Object> get props => [serverTime];

  @override
  bool get stringify => true;
}
