enum CypherMode {
  encrypt,
  decrypt
  ;

  String get value {
    switch (this) {
      case CypherMode.encrypt:
        return 'encrypt';
      case CypherMode.decrypt:
        return 'decrypt';
    }
  }
}
