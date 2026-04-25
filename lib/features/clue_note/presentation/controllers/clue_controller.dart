import 'package:get/get.dart';
import 'package:patrol_example/features/clue_note/domain/constants/card_data_list.dart';
import 'package:patrol_example/features/clue_note/domain/entities/guess_entity.dart';
import 'package:patrol_example/features/clue_note/domain/enums/card_state.dart';
import 'package:patrol_example/features/clue_note/domain/services/clue_solver_service.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/add_guess_dialog.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/info_bottom_sheet.dart';
import 'package:patrol_example/features/clue_note/presentation/widgets/init_game_dialog.dart';

class ClueIds {
  static const String restartGameDialogDropdown = 'RESTART_GAME_DIALOG_DROPDOWN';

  static const String _cardCheckBoxId = 'CARD_CHECK_BOX_ID_';
  static String getCardCheckBoxId(String cardName) {
    return '${_cardCheckBoxId}cardName';
  }
}

class ClueController extends GetxController {
  final clueSolverService = ClueSolverService();

  int playerCount = 2;
  Map<String, CardState> cardStateMap = {};
  String murdererAnswer = '';
  String weaponAnswer = '';
  String crimeSceneAnswer = '';

  @override
  void onInit() {
    super.onInit();

    clueSolverService.initGame(2);
    initCardStateMap();
  }

  void initCardStateMap() {
    cardStateMap.clear();
    List<String> allCards = [...weaponList, ...murdererList, ...crimeSceneList];
    for (final card in allCards) {
      cardStateMap[card] = CardState.unknown;
    }
    List<String> allCheckBoxIdList = allCards.map((e) => ClueIds.getCardCheckBoxId(e)).toList();
    murdererAnswer = '';
    weaponAnswer = '';
    crimeSceneAnswer = '';
    update(allCheckBoxIdList);
  }

  void openInitGameDialog() {
    playerCount = clueSolverService.players.length;
    Get.dialog(
      InitGameDialog(
        playerCount: clueSolverService.players.length,
        onDropdownChange: (int? newPlayerCount) {
          if (newPlayerCount != null) {
            playerCount = newPlayerCount;
            update([ClueIds.restartGameDialogDropdown]);
          }
        },
        onConfirm: () {
          print('Confirm with newGamePlayerCount: $playerCount');
          clueSolverService.initGame(playerCount);
          initCardStateMap();
        },
      ),
    );
  }

  void addGuess() {
    Get.dialog(
      AddGuessDialog(
        playerCount: playerCount,
        onConfirm: (GuessEntity entity) {
          clueSolverService.processSuggestion(
            suggester: entity.guessPlayer,
            suggestedCards: entity.guessedCard,
            responses: entity.responseList,
          );
        },
      ),
    );
  }

  void onCheckBoxChange({required String cardName, required bool? newValue}) {
    print('onCheckBoxChange called with $cardName value: $newValue');
    if (newValue != null) {
      cardStateMap[cardName] = newValue ? CardState.yes : CardState.unknown;
      update([ClueIds.getCardCheckBoxId(cardName)]);
      clueSolverService.setFact('Player 1', cardName, newValue ? CardState.yes : CardState.unknown);
    }
  }

  void openInfoBottomSheet() {
    Get.bottomSheet(
      InfoBottomSheet(
        playerCount: playerCount,
        board: clueSolverService.board,
        murdererAnswer: murdererAnswer,
        weaponAnswer: weaponAnswer,
        crimeSceneAnswer: crimeSceneAnswer,
      ),
    );
  }

  void updateAnswer(String card) {
    if (murdererList.contains(card)) {
      murdererAnswer = card;
    } else if (weaponList.contains(card)) {
      weaponAnswer = card;
    } else if (crimeSceneList.contains(card)) {
      crimeSceneAnswer = card;
    }
  }
}
