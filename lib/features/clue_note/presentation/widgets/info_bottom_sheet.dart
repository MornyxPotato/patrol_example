import 'package:flutter/material.dart';
import 'package:patrol_example/core/style.dart';
import 'package:patrol_example/features/clue_note/domain/constants/card_data_list.dart';
import 'package:patrol_example/features/clue_note/domain/enums/card_state.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/info_group.dart';

class InfoBottomSheet extends StatelessWidget {
  final int playerCount;
  // The knowledge grid: Map<PlayerName, Map<CardName, CardState>>
  final Map<String, Map<String, CardState>> board;
  final String murdererAnswer;
  final String weaponAnswer;
  final String crimeSceneAnswer;

  const InfoBottomSheet({
    super.key,
    required this.playerCount,
    required this.board,
    required this.murdererAnswer,
    required this.weaponAnswer,
    required this.crimeSceneAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        width: double.infinity,
        padding: EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Murderer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    InfoGroup(
                      playerCount: playerCount,
                      board: board,
                      valueList: murdererList,
                      answer: murdererAnswer,
                    ),
                    Text(
                      'Weapon',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    InfoGroup(
                      playerCount: playerCount,
                      board: board,
                      valueList: weaponList,
                      answer: weaponAnswer,
                    ),
                    Text(
                      'Crime Scene',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    InfoGroup(
                      playerCount: playerCount,
                      board: board,
                      valueList: crimeSceneList,
                      answer: crimeSceneAnswer,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
