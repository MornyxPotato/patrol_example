import 'package:flutter/material.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/card_list_item.dart';

class CardGroup extends StatelessWidget {
  static const double cardExtent = 50;

  final String groupName;
  final List<String> cardList;
  final Function(int) onItemTap;
  final Function(int, bool?) onCheckBoxChanged;

  const CardGroup({
    super.key,
    required this.groupName,
    required this.cardList,
    required this.onItemTap,
    required this.onCheckBoxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          groupName,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: cardExtent * cardList.length,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemExtent: cardExtent,
            itemCount: cardList.length,
            itemBuilder: (BuildContext context, int index) {
              return CardListItem(
                key: Key('CardItem${cardList[index]}'),
                onItemTap: () {
                  onItemTap(index);
                },
                onCheckBoxChanged: (bool? newValue) {
                  onCheckBoxChanged(index, newValue);
                },
                cardName: cardList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
