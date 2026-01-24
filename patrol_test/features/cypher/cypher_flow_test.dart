import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../core/init_app.dart';

void main() {
  patrolTest('Encrypt and decrypt text with atbash cypher', ($) async {
    // Open app.
    await initApp($);

    // Tap a button with key 'HomeCypherButton' to open cypher screen.
    await $(#HomeCypherButton).tap();
    // Tap a radio button with key 'CypherAtbashRadioButton' to select atbash cypher.
    await $(#CypherAtbashRadioButton).tap();
    // Tap a radio button with key 'CypherModeEncryptRadioButton' to select encrypt mode.
    await $(#CypherModeEncryptRadioButton).tap();
    // Enter text 'ABC' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('ABC');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, 'ZYX');

    // Clear text field by tapping a button with key 'CypherInput1ClearButton'.
    await $(#CypherInput1ClearButton).tap();
    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, isEmpty);

    // Tap a radio button with key 'CypherModeDecryptRadioButton' to select decrypt mode.
    await $(#CypherModeDecryptRadioButton).tap();
    // Enter text 'ZYX' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('ZYX');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, 'ABC');
  });

  patrolTest('Encrypt and decrypt text with A1Z26 cypher', ($) async {
    // Open app.
    await initApp($);

    // Tap a button with key 'HomeCypherButton' to open cypher screen.
    await $(#HomeCypherButton).tap();
    // Tap a radio button with key 'CypherA1Z26RadioButton' to select A1Z26 cypher.
    await $(#CypherA1Z26RadioButton).tap();
    // Tap a radio button with key 'CypherModeEncryptRadioButton' to select encrypt mode.
    await $(#CypherModeEncryptRadioButton).tap();
    // Enter text 'ABC' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('ABC');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, '1-2-3');

    // Clear text field by tapping a button with key 'CypherInput1ClearButton'.
    await $(#CypherInput1ClearButton).tap();
    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, isEmpty);

    // Tap a radio button with key 'CypherModeDecryptRadioButton' to select decrypt mode.
    await $(#CypherModeDecryptRadioButton).tap();
    // Enter text '1-2-3' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('1-2-3');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, 'ABC');
  });

  patrolTest('Encrypt and decrypt text with Caesar cypher', ($) async {
    // Open app.
    await initApp($);

    // Tap a button with key 'HomeCypherButton' to open cypher screen.
    await $(#HomeCypherButton).tap();
    // Tap a radio button with key 'CypherCaesarRadioButton' to select Caesar cypher.
    await $(#CypherCaesarRadioButton).tap();
    // Tap a radio button with key 'CypherModeEncryptRadioButton' to select encrypt mode.
    await $(#CypherModeEncryptRadioButton).tap();
    // Enter text 'ABC' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('ABC');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, 'DEF');

    // Clear text field by tapping a button with key 'CypherInput1ClearButton'.
    await $(#CypherInput1ClearButton).tap();
    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, isEmpty);

    // Tap a radio button with key 'CypherModeDecryptRadioButton' to select decrypt mode.
    await $(#CypherModeDecryptRadioButton).tap();
    // Enter text 'DEF' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('DEF');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, 'ABC');
  });

  patrolTest('Encrypt and decrypt text with Vigenere cypher', ($) async {
    // Open app.
    await initApp($);

    // Tap a button with key 'HomeCypherButton' to open cypher screen.
    await $(#HomeCypherButton).tap();
    // Tap a radio button with key 'CypherCaesarRadioButton' to select Caesar cypher.
    await $(#CypherVigenereRadioButton).tap();
    // Tap a radio button with key 'CypherModeEncryptRadioButton' to select encrypt mode.
    await $(#CypherModeEncryptRadioButton).tap();
    // Enter text 'Hello' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('Hello');
    // Enter text 'Key' into a text field with key 'CypherInput2'.
    await $(#CypherInput2).enterText('Key');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, 'Rijvs');

    // Clear text field by tapping a button with key 'CypherInput1ClearButton'.
    await $(#CypherInput1ClearButton).tap();
    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, isEmpty);

    // Tap a radio button with key 'CypherModeDecryptRadioButton' to select decrypt mode.
    await $(#CypherModeDecryptRadioButton).tap();
    // Enter text 'Rijvs' into a text field with key 'CypherInput1'.
    await $(#CypherInput1).enterText('Rijvs');

    // Check the result in widget with key 'CypherResult'.
    expect($(#CypherResult).text, 'Hello');
  });
}
