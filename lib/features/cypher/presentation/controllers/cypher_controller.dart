import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';
import 'package:patrol_example/features/cypher/domain/enums/cypher_type.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_a1z26_cypher_use_case.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_atbash_cypher_use_case.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_caesar_cypher_use_case.dart';
import 'package:patrol_example/features/cypher/domain/use_cases/process_vigenere_cypher_use_case.dart';

class CypherIds {
  static const cypherTypeRadio = 'CYPHER_TYPE_RADIO';
  static const cypherModeRadio = 'CYPHER_MODE_RADIO';
  static const cypherInput1 = 'CYPHER_INPUT1';
  static const cypherInput2 = 'CYPHER_INPUT2';
  static const cypherResult = 'CYPHER_RESULT';
}

class CypherController extends GetxController {
  CypherType selectedCypher = CypherType.atbash;
  CypherMode mode = CypherMode.encrypt;

  TextEditingController cypherInput1Ctl = TextEditingController();
  TextEditingController cypherInput2Ctl = TextEditingController();
  String cypherResult = '';

  bool get showInput2 {
    if (selectedCypher == CypherType.vigenere) return true;
    return false;
  }

  void onCypherSelected(CypherType newValue) {
    selectedCypher = newValue;
    process();
    update([
      CypherIds.cypherTypeRadio,
      CypherIds.cypherInput1,
      CypherIds.cypherInput2,
      CypherIds.cypherResult,
    ]);
  }

  void onModeSelect(CypherMode newMode) {
    mode = newMode;
    process();
    update([
      CypherIds.cypherModeRadio,
      CypherIds.cypherInput1,
      CypherIds.cypherResult,
    ]);
  }

  void onInput1Changed(String newText) {
    process();
    update([CypherIds.cypherInput1]);
  }

  void onInput2Changed(String newText) {
    process();
    update([CypherIds.cypherInput2]);
  }

  void onClearInput1() {
    cypherInput1Ctl.clear();
    cypherResult = '';
    update([CypherIds.cypherInput1, CypherIds.cypherResult]);
  }

  void onClearInput2() {
    cypherInput2Ctl.clear();
    cypherResult = '';
    update([CypherIds.cypherInput2, CypherIds.cypherResult]);
  }

  void process() {
    String result = cypherInput1Ctl.text;

    switch (selectedCypher) {
      case CypherType.atbash:
        result = GetIt.I<ProcessAtbashCypherUseCase>().call(
          ProcessAtbashCypherParams(
            input: cypherInput1Ctl.text,
          ),
        );
        break;
      case CypherType.a1z26:
        result = GetIt.I<ProcessA1z26CypherUseCase>().call(
          ProcessA1z26CypherParams(
            input: cypherInput1Ctl.text,
            mode: mode,
          ),
        );
        break;
      case CypherType.caesar:
        result = GetIt.I<ProcessCaesarCypherUseCase>().call(
          ProcessCaesarCypherParams(
            input: cypherInput1Ctl.text,
            mode: mode,
          ),
        );
        break;
      case CypherType.vigenere:
        result = GetIt.I<ProcessVigenereCypherUseCase>().call(
          ProcessVigenereCypherParams(
            input: cypherInput1Ctl.text,
            key: cypherInput2Ctl.text,
            mode: mode,
          ),
        );
        break;
    }

    cypherResult = result;
    update([CypherIds.cypherResult]);
  }
}
