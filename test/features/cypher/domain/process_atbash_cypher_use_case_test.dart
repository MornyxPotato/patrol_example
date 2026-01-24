import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_atbash_cypher_use_case.dart';

void main() {
  late ProcessAtbashCypherUseCase useCase;

  setUp(() {
    useCase = ProcessAtbashCypherUseCase();
  });

  test('Should encrypt correctly', () {
    final result1 = useCase.call(ProcessAtbashCypherParams(input: 'ABC'));
    final result2 = useCase.call(ProcessAtbashCypherParams(input: 'Hello World'));

    expect(result1, equals('ZYX'));
    expect(result2, equals('Svool Dliow'));
  });

  test('Should decrypt correctly (Symmetrical)', () {
    final result1 = useCase.call(ProcessAtbashCypherParams(input: 'ZYX'));
    final result2 = useCase.call(ProcessAtbashCypherParams(input: 'Svool Dliow'));

    expect(result1, equals('ABC'));
    expect(result2, equals('Hello World'));
  });
}
