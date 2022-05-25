import '../exceptions/exceptions.dart';
import '../models/models.dart';

mixin CredentialsMixin {
  CredentialsModel? _credentials;

  void withCredentials({
    String? apiKey,
    String? apiSecret,
  }) {
    if (apiKey == null || apiSecret == null) {
      throw BinanceApiCredentialsException('The API key or secret is not set.', 100);
    }
    _credentials = CredentialsModel(apiKey, apiSecret);
  }

  CredentialsModel? getCredentials() => _credentials;
}
