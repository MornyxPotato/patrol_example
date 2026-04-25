import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/clue_note/presentation/controllers/clue_controller.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/dialog_button.dart';

class InitGameDialog extends StatelessWidget {
  final int playerCount;
  final Function(int?) onDropdownChange;
  final Function onConfirm;

  const InitGameDialog({
    super.key,
    required this.playerCount,
    required this.onDropdownChange,
    required this.onConfirm,
  });

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
              'Restart Game ?',
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            GetBuilder<ClueController>(
              id: ClueIds.restartGameDialogDropdown,
              builder: (ctl) {
                return DropdownButton<int>(
                  items: [
                    DropdownMenuItem(
                      value: 2,
                      child: Text('2'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('3'),
                    ),
                    DropdownMenuItem(
                      value: 4,
                      child: Text('4'),
                    ),
                    DropdownMenuItem(
                      value: 5,
                      child: Text('5'),
                    ),
                    DropdownMenuItem(
                      value: 6,
                      child: Text('6'),
                    ),
                  ],
                  value: ctl.playerCount,
                  onChanged: (newValue) {
                    onDropdownChange(newValue);
                  },
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
                    onConfirm();
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
