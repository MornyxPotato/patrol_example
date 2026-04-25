import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/clue_note/domain/constants/card_data_list.dart';
import 'package:patrol_example/features/clue_note/domain/enums/card_state.dart';
import 'package:patrol_example/features/clue_note/presentation/controllers/clue_controller.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/card_group.dart';

class ClueScreen extends GetView<ClueController> {
  const ClueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          'Clue',
          style: TextStyle(
            color: AppColors.textOrIconColor,
          ),
        ),
        actions: [
          IconButton(
            key: const Key('ClueResetGameButton'),
            onPressed: controller.openInitGameDialog,
            icon: Icon(
              Icons.restart_alt,
              color: AppColors.textOrIconColor,
            ),
          ),
        ],
        iconTheme: IconThemeData(color: AppColors.textOrIconColor),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  child: TextButton(
                    key: const Key('ClueAddGuessButton'),
                    onPressed: () {
                      controller.addGuess();
                    },
                    child: Text(
                      'Add guess',
                      style: TextStyle(
                        color: AppColors.textOrIconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  child: TextButton(
                    key: const Key('ClueInfoButton'),
                    onPressed: () {
                      controller.openInfoBottomSheet();
                    },
                    child: Text(
                      'See Info',
                      style: TextStyle(
                        color: AppColors.textOrIconColor,
                      ),
                    ),
                  ),
                ),
                CardGroup(
                  groupName: 'Murderer',
                  cardList: murdererList,
                  onItemTap: (int index) {
                    controller.onCheckBoxChange(
                      cardName: murdererList[index],
                      newValue: !(controller.cardStateMap[murdererList[index]] == CardState.yes),
                    );
                  },
                  onCheckBoxChanged: (int index, bool? newValue) {
                    controller.onCheckBoxChange(
                      cardName: murdererList[index],
                      newValue: newValue,
                    );
                  },
                ),
                CardGroup(
                  groupName: 'Weapon',
                  cardList: weaponList,
                  onItemTap: (int index) {
                    controller.onCheckBoxChange(
                      cardName: weaponList[index],
                      newValue: !(controller.cardStateMap[weaponList[index]] == CardState.yes),
                    );
                  },
                  onCheckBoxChanged: (int index, bool? newValue) {
                    controller.onCheckBoxChange(
                      cardName: weaponList[index],
                      newValue: newValue,
                    );
                  },
                ),
                CardGroup(
                  groupName: 'Crime Scene',
                  cardList: crimeSceneList,
                  onItemTap: (int index) {
                    controller.onCheckBoxChange(
                      cardName: crimeSceneList[index],
                      newValue: !(controller.cardStateMap[crimeSceneList[index]] == CardState.yes),
                    );
                  },
                  onCheckBoxChanged: (int index, bool? newValue) {
                    controller.onCheckBoxChange(
                      cardName: crimeSceneList[index],
                      newValue: newValue,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
