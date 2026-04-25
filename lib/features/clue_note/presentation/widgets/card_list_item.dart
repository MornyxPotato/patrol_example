import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/clue_note/domain/enums/card_state.dart';
import 'package:patrol_example/features/clue_note/presentation/controllers/clue_controller.dart';

class CardListItem extends StatelessWidget {
  final Function() onItemTap;
  final Function(bool?) onCheckBoxChanged;
  final String cardName;

  const CardListItem({
    super.key,
    required this.onItemTap,
    required this.onCheckBoxChanged,
    required this.cardName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cardName),
            GetBuilder<ClueController>(
              id: ClueIds.getCardCheckBoxId(cardName),
              builder: (ctl) {
                return Checkbox(
                  key: Key('CardCheckBox$cardName'),
                  value: ctl.cardStateMap[cardName] == CardState.yes,
                  activeColor: AppColors.accentPrimaryColor,
                  onChanged: (newValue) {
                    onCheckBoxChanged(newValue);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
