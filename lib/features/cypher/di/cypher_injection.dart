import 'package:get_it/get_it.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_a1z26_cypher_use_case.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_atbash_cypher_use_case.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_caesar_cypher_use_case.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_vigenere_cypher_use_case.dart';

void registerCypherDependencies() {
  final getIt = GetIt.instance;

  getIt.registerFactory(() => ProcessA1z26CypherUseCase());
  getIt.registerFactory(() => ProcessAtbashCypherUseCase());
  getIt.registerFactory(() => ProcessCaesarCypherUseCase());
  getIt.registerFactory(() => ProcessVigenereCypherUseCase());
}
