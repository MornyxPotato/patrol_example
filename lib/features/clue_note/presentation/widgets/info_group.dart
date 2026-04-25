import 'package:flutter/material.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/clue_note/domain/enums/card_state.dart';

class InfoGroup extends StatelessWidget {
  final int playerCount;
  final Map<String, Map<String, CardState>> board;
  final List<String> valueList;
  final String answer;

  const InfoGroup({
    super.key,
    required this.playerCount,
    required this.board,
    required this.valueList,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0 * valueList.length,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemExtent: 50,
        itemCount: valueList.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  valueList[index],
                  style: TextStyle(
                    fontWeight: valueList[index] == answer ? FontWeight.bold : null,
                    color: valueList[index] == answer ? AppColors.accentPrimaryColor : null,
                  ),
                ),
              ),
              ...List.generate(playerCount, (i) {
                CardState? state = board['Player ${i + 1}']?[valueList[index]];
                return Expanded(
                  child: Text(
                    state?.toString() ?? '-',
                    style: TextStyle(
                      color: state == CardState.yes
                          ? Colors.green
                          : state == CardState.no
                          ? Colors.red
                          : null,
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
