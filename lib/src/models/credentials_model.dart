import 'package:equatable/equatable.dart';

class CredentialsModel extends Equatable {
  final String apiKey;
  final String apiSecret;

  const CredentialsModel(this.apiKey, this.apiSecret);

  @override
  List<Object> get props => [apiKey, apiSecret];

  @override
  bool get stringify => false;
}
