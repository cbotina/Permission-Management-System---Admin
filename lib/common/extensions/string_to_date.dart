extension ToDateTime on String {
  DateTime toDateTime() {
    final parts = split('-').map((e) => int.parse(e)).toList();
    return DateTime(parts[0], parts[1], parts[2]);
  }
}
