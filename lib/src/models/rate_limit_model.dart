import 'package:equatable/equatable.dart';

class RateLimitModel extends Equatable {
  final String rateLimitType;
  final int intervalNum;
  final String interval;
  final int limit;

  const RateLimitModel({
    required this.rateLimitType,
    required this.intervalNum,
    required this.interval,
    required this.limit,
  });

  factory RateLimitModel.fromJson(Map<String, dynamic> json) {
    return RateLimitModel(
      rateLimitType: json['rateLimitType'],
      intervalNum: json['intervalNum'],
      interval: json['interval'],
      limit: json['limit'],
    );
  }

  @override
  List<Object> get props => [rateLimitType, intervalNum, interval, limit];

  @override
  bool get stringify => true;
}
