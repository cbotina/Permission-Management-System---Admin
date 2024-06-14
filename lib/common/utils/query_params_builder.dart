String buildQueryParams(Map<String, String> params) {
  List<String> queryParams = [];
  for (MapEntry entry in params.entries) {
    if (entry.value != '') {
      queryParams.add('${entry.key}=${entry.value}');
    }
  }
  return ('?${queryParams.join('&')}');
}
