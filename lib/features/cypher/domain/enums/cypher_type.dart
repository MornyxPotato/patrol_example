enum CypherType {
  atbash,
  a1z26,
  caesar,
  vigenere
  ;

  static CypherType from(String value) {
    switch (value) {
      case 'ATBASH':
        return CypherType.atbash;
      case 'A1Z26':
        return CypherType.a1z26;
      case 'CAESAR':
        return CypherType.caesar;
      case 'VIGENERE':
        return CypherType.vigenere;
      default:
        throw Exception('Invalid value : $value');
    }
  }

  String get value {
    switch (this) {
      case CypherType.atbash:
        return 'ATBASH';
      case CypherType.a1z26:
        return 'A1Z26';
      case CypherType.caesar:
        return 'CAESAR';
      case CypherType.vigenere:
        return 'VIGENERE';
    }
  }
}
