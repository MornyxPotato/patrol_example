import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/cypher/domain/enums/cypher_mode.dart';
import 'package:patrol_example/features/cypher/domain/enums/cypher_type.dart';
import 'package:patrol_example/features/cypher/presentation/controllers/cypher_controller.dart';
import 'package:patrol_example/features/cypher/presentation/widgets/cypher_input.dart';
import 'package:patrol_example/features/cypher/presentation/widgets/cypher_radio_button.dart';
import 'package:patrol_example/features/cypher/presentation/widgets/cypher_result.dart';

class CypherScreen extends GetView<CypherController> {
  const CypherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          'Cypher',
          style: TextStyle(
            color: AppColors.textOrIconColor,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.textOrIconColor),
        backgroundColor: AppColors.primaryColor,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          key: const Key('CypherScreenBody'),
          color: Colors.transparent,
          child: Column(
            children: [
              GetBuilder<CypherController>(
                id: CypherIds.cypherTypeRadio,
                builder: (ctl) {
                  return RadioGroup<CypherType>(
                    groupValue: controller.selectedCypher,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.onCypherSelected(newValue);
                      }
                    },
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          CypherRadioButton<CypherType>(
                            key: const Key('CypherAtbashRadioButton'),
                            type: CypherType.atbash,
                            text: 'Atbash',
                            onTap: controller.onCypherSelected,
                          ),
                          CypherRadioButton<CypherType>(
                            key: const Key('CypherA1Z26RadioButton'),
                            type: CypherType.a1z26,
                            text: 'A1Z26',
                            onTap: controller.onCypherSelected,
                          ),
                          CypherRadioButton<CypherType>(
                            key: const Key('CypherCaesarRadioButton'),
                            type: CypherType.caesar,
                            text: 'Caesar',
                            onTap: controller.onCypherSelected,
                          ),
                          CypherRadioButton<CypherType>(
                            key: const Key('CypherVigenereRadioButton'),
                            type: CypherType.vigenere,
                            text: 'Vigenere',
                            onTap: controller.onCypherSelected,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              GetBuilder<CypherController>(
                id: CypherIds.cypherModeRadio,
                builder: (ctl) {
                  return RadioGroup<CypherMode>(
                    groupValue: controller.mode,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.onModeSelect(newValue);
                      }
                    },
                    child: Row(
                      children: [
                        CypherRadioButton<CypherMode>(
                          key: const Key('CypherModeEncryptRadioButton'),
                          type: CypherMode.encrypt,
                          text: 'Encrypt',
                          onTap: controller.onModeSelect,
                        ),
                        CypherRadioButton<CypherMode>(
                          key: const Key('CypherModeDecryptRadioButton'),
                          type: CypherMode.decrypt,
                          text: 'Decrypt',
                          onTap: controller.onModeSelect,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Text(
                'Input',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              GetBuilder<CypherController>(
                id: CypherIds.cypherInput1,
                builder: (ctl) {
                  return CypherInput(
                    key: const Key('CypherInput1'),
                    textEditingController: controller.cypherInput1Ctl,
                    hintText: 'Enter text to ${controller.mode.value}...',
                    onChanged: controller.onInput1Changed,
                    onClear: controller.onClearInput1,
                    clearButtonKey: const Key('CypherInput1ClearButton'),
                  );
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<CypherController>(
                id: CypherIds.cypherInput2,
                builder: (ctl) {
                  if (controller.showInput2) {
                    return CypherInput(
                      key: const Key('CypherInput2'),
                      textEditingController: controller.cypherInput2Ctl,
                      hintText: 'Enter Vigenere key...',
                      onChanged: controller.onInput2Changed,
                      onClear: controller.onClearInput2,
                      clearButtonKey: const Key('CypherInput2ClearButton'),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              GetBuilder<CypherController>(
                id: CypherIds.cypherResult,
                builder: (ctl) {
                  return CypherResult(
                    text: controller.cypherResult,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
