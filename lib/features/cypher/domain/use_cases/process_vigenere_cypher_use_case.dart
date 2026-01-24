import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';

class ProcessVigenereCypherParams {
  final String input;
  final String key;
  final CypherMode mode;

  ProcessVigenereCypherParams({required this.input, required this.key, required this.mode});
}

class ProcessVigenereCypherUseCase {
  String call(ProcessVigenereCypherParams params) {
    if (params.key.isEmpty) return params.input;

    String result = "";
    String cleanKey = params.key.toUpperCase();
    int keyIndex = 0;

    for (int i = 0; i < params.input.length; i++) {
      int charCode = params.input.codeUnitAt(i);
      bool isUpper = charCode >= 65 && charCode <= 90;
      bool isLower = charCode >= 97 && charCode <= 122;

      if (isUpper || isLower) {
        int base = isUpper ? 65 : 97;
        int p = charCode - base;
        int k = cleanKey.codeUnitAt(keyIndex % cleanKey.length) - 65;

        int processed;
        if (params.mode == CypherMode.encrypt) {
          processed = (p + k) % 26;
        } else {
          processed = (p - k + 26) % 26;
        }

        result += String.fromCharCode(processed + base);
        keyIndex++;
      } else {
        result += params.input[i];
      }
    }
    return result;
  }
}
