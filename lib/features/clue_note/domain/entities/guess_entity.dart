import 'package:patrol_example/features/clue_note/domain/entities/suggestion_response.dart';

class GuessEntity {
  String guessPlayer;
  List<String> guessedCard;
  List<SuggestionResponse> responseList;

  GuessEntity({
    required this.guessPlayer,
    required this.guessedCard,
    required this.responseList,
  });
}
