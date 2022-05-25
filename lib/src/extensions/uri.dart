extension UriExtension on Uri {
  /// [withSuffixPath] Append to existing path.
  Uri withSuffixPath(String path) {
    return replace(path: this.path + path);
  }

  /// [withQueryParameters] Append to existing query parameters.
  Uri withQueryParameters(Map<String, dynamic> queryParameters) {
    return replace(queryParameters: {...this.queryParameters, ...queryParameters});
  }
}
