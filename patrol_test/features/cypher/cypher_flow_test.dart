import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../core/init_app.dart';

void main() {
  patrolTest('Encrypt and decrypt text with atbash cypher', ($) async {
    await initApp($);

    await $(#HomeCypherButton).tap();
    await $(#CypherAtbashRadioButton).tap();
    await $(#CypherModeEncryptRadioButton).tap();
    await $(#CypherInput1).enterText('ABC');

    expect($(#CypherResult).text, 'ZYX');

    await $(#CypherInput1ClearButton).tap();
    expect($(#CypherResult).text, isEmpty);

    await $(#CypherModeDecryptRadioButton).tap();
    await $(#CypherInput1).enterText('ZYX');

    expect($(#CypherResult).text, 'ABC');
  });

  patrolTest('Encrypt and decrypt text with A1Z26 cypher', ($) async {
    await initApp($);

    await $(#HomeCypherButton).tap();
    await $(#CypherA1Z26RadioButton).tap();
    await $(#CypherModeEncryptRadioButton).tap();
    await $(#CypherInput1).enterText('ABC');

    expect($(#CypherResult).text, '1-2-3');

    await $(#CypherInput1ClearButton).tap();
    expect($(#CypherResult).text, isEmpty);

    await $(#CypherModeDecryptRadioButton).tap();
    await $(#CypherInput1).enterText('1-2-3');

    expect($(#CypherResult).text, 'ABC');
  });

  patrolTest('Encrypt and decrypt text with Caesar cypher', ($) async {
    await initApp($);

    await $(#HomeCypherButton).tap();
    await $(#CypherCaesarRadioButton).tap();
    await $(#CypherModeEncryptRadioButton).tap();
    await $(#CypherInput1).enterText('ABC');

    expect($(#CypherResult).text, 'DEF');

    await $(#CypherInput1ClearButton).tap();
    expect($(#CypherResult).text, isEmpty);

    await $(#CypherModeDecryptRadioButton).tap();
    await $(#CypherInput1).enterText('DEF');

    expect($(#CypherResult).text, 'ABC');
  });

  patrolTest('Encrypt and decrypt text with Vigenere cypher', ($) async {
    await initApp($);

    await $(#HomeCypherButton).tap();
    await $(#CypherVigenereRadioButton).tap();
    await $(#CypherModeEncryptRadioButton).tap();
    await $(#CypherInput1).enterText('Hello');
    await $(#CypherInput2).enterText('Key');

    expect($(#CypherResult).text, 'Rijvs');

    await $(#CypherInput1ClearButton).tap();
    expect($(#CypherResult).text, isEmpty);

    await $(#CypherModeDecryptRadioButton).tap();
    await $(#CypherInput1).enterText('Rijvs');

    expect($(#CypherResult).text, 'Hello');
  });
}
