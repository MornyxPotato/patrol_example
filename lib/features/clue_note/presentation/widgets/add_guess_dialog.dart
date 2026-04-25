import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/clue_note/domain/constants/card_data_list.dart';
import 'package:patrol_example/features/clue_note/domain/entities/guess_entity.dart';
import 'package:patrol_example/features/clue_note/presentation/controllers/add_guess_controller.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/add_guess_drop_down_row.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/card_shown_drop_down_row.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/dialog_button.dart';

class AddGuessDialog extends GetView<AddGuessController> {
  final int playerCount;
  final Function(GuessEntity) onConfirm;

  const AddGuessDialog({super.key, required this.playerCount, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.lightPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add guess',
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            GetBuilder<AddGuessController>(
              init: AddGuessController(playerCount: playerCount),
              id: AddGuessIds.addGuessDropDownRow,
              builder: (ctl) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AddGuessDropDownRow(
                      value: ctl.guessPlayer,
                      title: 'Guess Player',
                      valueList: ctl.playerList,
                      onChanged: ctl.onPlayerChange,
                    ),
                    AddGuessDropDownRow(
                      value: ctl.murderer,
                      title: 'Murderer',
                      valueList: murdererList,
                      onChanged: ctl.onMurdererChange,
                    ),
                    AddGuessDropDownRow(
                      value: ctl.weapon,
                      title: 'Weapon',
                      valueList: weaponList,
                      onChanged: ctl.onWeaponChange,
                    ),
                    AddGuessDropDownRow(
                      value: ctl.crimeScene,
                      title: 'Crime Scene',
                      valueList: crimeSceneList,
                      onChanged: ctl.onCrimeSceneChange,
                    ),
                    if (ctl.guessPlayer == 'Player 1') ...[
                      CardShownDropDownRow(
                        value: ctl.card1ShownBy,
                        title: 'Murderer Shown',
                        valueList: ctl.playerList,
                        onChanged: ctl.onCard1ShownByChanged,
                        shown: ctl.card1Shown,
                        onShownChanged: ctl.onCard1ShownChanged,
                      ),
                      CardShownDropDownRow(
                        value: ctl.card2ShownBy,
                        title: 'Weapon Shown',
                        valueList: ctl.playerList,
                        onChanged: ctl.onCard2ShownByChanged,
                        shown: ctl.card2Shown,
                        onShownChanged: ctl.onCard2ShownChanged,
                      ),
                      CardShownDropDownRow(
                        value: ctl.card3ShownBy,
                        title: 'Crime Scene Shown',
                        valueList: ctl.playerList,
                        onChanged: ctl.onCard3ShownByChanged,
                        shown: ctl.card3Shown,
                        onShownChanged: ctl.onCard3ShownChanged,
                      ),
                    ] else ...[
                      CardShownDropDownRow(
                        value: ctl.card1ShownBy,
                        title: 'Card 1 Shown',
                        valueList: ctl.playerList,
                        onChanged: ctl.onCard1ShownByChanged,
                        shown: ctl.card1Shown,
                        onShownChanged: ctl.onCard1ShownChanged,
                      ),
                      CardShownDropDownRow(
                        value: ctl.card2ShownBy,
                        title: 'Card 2 Shown',
                        valueList: ctl.playerList,
                        onChanged: ctl.onCard2ShownByChanged,
                        shown: ctl.card2Shown,
                        onShownChanged: ctl.onCard2ShownChanged,
                      ),
                      CardShownDropDownRow(
                        value: ctl.card3ShownBy,
                        title: 'Card 3 Shown',
                        valueList: ctl.playerList,
                        onChanged: ctl.onCard3ShownByChanged,
                        shown: ctl.card3Shown,
                        onShownChanged: ctl.onCard3ShownChanged,
                      ),
                    ],
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DialogButton(
                  onPressed: () {
                    Get.back();
                  },
                  textButton: 'Cancel',
                ),
                DialogButton(
                  onPressed: () {
                    onConfirm(controller.getGuessEntity());
                    Get.back();
                  },
                  textButton: 'Confirm',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
