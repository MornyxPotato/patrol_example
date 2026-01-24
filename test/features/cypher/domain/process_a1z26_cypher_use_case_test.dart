import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_a1z26_cypher_use_case.dart';

void main() {
  late ProcessA1z26CypherUseCase useCase;

  setUp(() {
    useCase = ProcessA1z26CypherUseCase();
  });

  test('Should encrypt with standard shift', () {
    final result1 = useCase.call(ProcessA1z26CypherParams(input: 'ABC', mode: CypherMode.encrypt));
    final result2 = useCase.call(ProcessA1z26CypherParams(input: 'Hello', mode: CypherMode.encrypt));

    expect(result1, equals('1-2-3'));
    expect(result2, equals('8-5-12-12-15'));
  });

  test('Should decrypt correctly', () {
    final result1 = useCase.call(ProcessA1z26CypherParams(input: '1-2-3', mode: CypherMode.decrypt));
    final result2 = useCase.call(ProcessA1z26CypherParams(input: '8-5-12-12-15', mode: CypherMode.decrypt));

    expect(result1, equals('ABC'));
    expect(result2, equals('HELLO'));
  });
}
