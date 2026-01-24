import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';

class ProcessCaesarCypherParams {
  final String input;
  final CypherMode mode;

  ProcessCaesarCypherParams({required this.input, required this.mode});
}

class ProcessCaesarCypherUseCase {
  String call(ProcessCaesarCypherParams params) {
    const int shift = 3;
    int effectiveShift = params.mode == CypherMode.encrypt ? shift : -shift;

    return params.input
        .split('')
        .map((char) {
          int code = char.codeUnitAt(0);
          if (code >= 65 && code <= 90) {
            return String.fromCharCode(((code - 65 + effectiveShift) % 26 + 26) % 26 + 65);
          } else if (code >= 97 && code <= 122) {
            return String.fromCharCode(((code - 97 + effectiveShift) % 26 + 26) % 26 + 97);
          }
          return char;
        })
        .join('');
  }
}
