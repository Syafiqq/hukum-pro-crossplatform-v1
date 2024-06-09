extension StringParser on String {
  int? toInt() {
    return int.tryParse(this);
  }
}

extension ListNonNullableExtension<Source> on List<Source> {
  List<Destination> mapToNonNull<Destination>(
    Destination? Function(Source source) converter,
  ) {
    return map((e) => converter(e))
        .where((element) => element != null)
        .cast<Destination>()
        .toList();
  }
}
