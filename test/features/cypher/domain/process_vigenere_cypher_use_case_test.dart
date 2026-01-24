import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_vigenere_cypher_use_case.dart';

void main() {
  late ProcessVigenereCypherUseCase useCase;

  setUp(() {
    useCase = ProcessVigenereCypherUseCase();
  });

  test('Should encrypt using keyword', () {
    final result = useCase.call(ProcessVigenereCypherParams(input: 'Hello', key: 'Key', mode: CypherMode.encrypt));

    expect(result, equals('Rijvs'));
  });

  test('Should decrypt using keyword', () {
    final result = useCase.call(ProcessVigenereCypherParams(input: 'RIJVS', key: 'KEY', mode: CypherMode.decrypt));

    expect(result, equals('HELLO'));
  });

  test('Should handle spaces and case sensitivity', () {
    final result = useCase.call(
      ProcessVigenereCypherParams(input: 'Hello World', key: 'abc', mode: CypherMode.encrypt),
    );

    expect(result, equals('Hfnlp Yosnd'));
  });
}
