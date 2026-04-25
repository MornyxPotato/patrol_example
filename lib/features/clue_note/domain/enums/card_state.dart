enum CardState {
  yes,
  no,
  unknown
  ;

  @override
  String toString() {
    switch (this) {
      case yes:
        return 'Yes';
      case no:
        return 'No';
      case unknown:
        return '-';
    }
  }
}
