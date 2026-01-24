import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';

class ProcessA1z26CypherParams {
  final String input;
  final CypherMode mode;

  ProcessA1z26CypherParams({required this.input, required this.mode});
}

class ProcessA1z26CypherUseCase {
  String call(ProcessA1z26CypherParams params) {
    if (params.mode == CypherMode.encrypt) {
      return params.input
          .toUpperCase()
          .split('')
          .where((c) => RegExp(r'[A-Z]').hasMatch(c))
          .map((char) {
            return (char.codeUnitAt(0) - 64).toString();
          })
          .join('-');
    } else {
      return params.input
          .split('-')
          .map((part) {
            int? val = int.tryParse(part);
            return val != null ? String.fromCharCode(val + 64) : '';
          })
          .join('');
    }
  }
}
