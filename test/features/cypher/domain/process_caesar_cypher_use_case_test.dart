import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_caesar_cypher_use_case.dart';

void main() {
  late ProcessCaesarCypherUseCase useCase;

  setUp(() {
    useCase = ProcessCaesarCypherUseCase();
  });

  test('Should encrypt with standard shift', () {
    final result1 = useCase.call(ProcessCaesarCypherParams(input: 'ABC', mode: CypherMode.encrypt));
    final result2 = useCase.call(ProcessCaesarCypherParams(input: 'XyZ', mode: CypherMode.encrypt));

    expect(result1, equals('DEF'));
    expect(result2, equals('AbC'));
  });

  test('Should decrypt correctly', () {
    final result1 = useCase.call(ProcessCaesarCypherParams(input: 'DEF', mode: CypherMode.decrypt));
    final result2 = useCase.call(ProcessCaesarCypherParams(input: 'AbC', mode: CypherMode.decrypt));

    expect(result1, equals('ABC'));
    expect(result2, equals('XyZ'));
  });
}
