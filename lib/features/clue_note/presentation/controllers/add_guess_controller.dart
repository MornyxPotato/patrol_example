import 'package:get/get.dart';
import 'package:patrol_example/features/clue_note/domain/constants/card_data_list.dart';
import 'package:patrol_example/features/clue_note/domain/entities/guess_entity.dart';
import 'package:patrol_example/features/clue_note/domain/entities/suggestion_response.dart';

class AddGuessIds {
  static const addGuessDropDownRow = 'ADD_GUESS_DROP_DOWN_ROW';
}

class AddGuessController extends GetxController {
  int playerCount;
  String guessPlayer = 'Player 1';
  String murderer = murdererList.first;
  String weapon = weaponList.first;
  String crimeScene = crimeSceneList.first;
  List<String> playerList = [];
  String card1ShownBy = 'Player 1';
  String card2ShownBy = 'Player 1';
  String card3ShownBy = 'Player 1';
  bool card1Shown = false;
  bool card2Shown = false;
  bool card3Shown = false;

  AddGuessController({required this.playerCount});

  @override
  void onInit() {
    super.onInit();
    playerList = List.generate(playerCount, (e) => 'Player ${e + 1}');
  }

  void onPlayerChange(String? newValue) {
    if (newValue != null) {
      guessPlayer = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onMurdererChange(String? newValue) {
    if (newValue != null) {
      murderer = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onWeaponChange(String? newValue) {
    if (newValue != null) {
      weapon = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onCrimeSceneChange(String? newValue) {
    if (newValue != null) {
      crimeScene = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onCard1ShownByChanged(String? newValue) {
    if (newValue != null) {
      card1ShownBy = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onCard2ShownByChanged(String? newValue) {
    if (newValue != null) {
      card2ShownBy = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onCard3ShownByChanged(String? newValue) {
    if (newValue != null) {
      card3ShownBy = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onCard1ShownChanged(bool? newValue) {
    if (newValue != null) {
      card1Shown = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onCard2ShownChanged(bool? newValue) {
    if (newValue != null) {
      card2Shown = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  void onCard3ShownChanged(bool? newValue) {
    if (newValue != null) {
      card3Shown = newValue;
      update([AddGuessIds.addGuessDropDownRow]);
    }
  }

  GuessEntity getGuessEntity() {
    List<SuggestionResponse> responseList = [];
    List<String> allOtherPlayer = List.from(playerList);
    allOtherPlayer.remove(guessPlayer);
    responseList.addAll(
      _getSuggestionResponse(
        cardShown: card1Shown,
        cardShownBy: card1ShownBy,
        cardNumber: 1,
        allOtherPlayer: allOtherPlayer,
      ),
    );
    responseList.addAll(
      _getSuggestionResponse(
        cardShown: card2Shown,
        cardShownBy: card2ShownBy,
        cardNumber: 2,
        allOtherPlayer: allOtherPlayer,
      ),
    );
    responseList.addAll(
      _getSuggestionResponse(
        cardShown: card3Shown,
        cardShownBy: card3ShownBy,
        cardNumber: 3,
        allOtherPlayer: allOtherPlayer,
      ),
    );
    for (final player in allOtherPlayer) {
      responseList.add(SuggestionResponse.pass(player));
    }

    return GuessEntity(
      guessPlayer: guessPlayer,
      guessedCard: [murderer, weapon, crimeScene],
      responseList: responseList,
    );
  }

  List<SuggestionResponse> _getSuggestionResponse({
    required bool cardShown,
    required String cardShownBy,
    required int cardNumber,
    required List<String> allOtherPlayer,
  }) {
    List<SuggestionResponse> result = [];
    if (cardShown) {
      String? shownCard;
      if (guessPlayer == 'Player 1') {
        if (cardNumber == 1) {
          shownCard = murderer;
        } else if (cardNumber == 2) {
          shownCard = weapon;
        } else if (cardNumber == 3) {
          shownCard = crimeScene;
        }
      }
      allOtherPlayer.remove(cardShownBy);
      result.add(SuggestionResponse.showed(cardShownBy, shownCard: shownCard));
    }
    return result;
  }
}
