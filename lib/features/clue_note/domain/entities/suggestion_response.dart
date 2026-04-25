import 'package:patrol_example/features/clue_note/domain/enums/response_type.dart';

class SuggestionResponse {
  final String player;
  final ResponseType type;
  final String? shownCard; // Only used if they showed a card AND you got to see it

  // Constructor for a player who doesn't have the cards
  SuggestionResponse.pass(this.player) : type = ResponseType.pass, shownCard = null;

  // Constructor for a player who showed a card
  SuggestionResponse.showed(this.player, {this.shownCard}) : type = ResponseType.showedCard;

  @override
  String toString() {
    return 'player: $player, type: $type, shownCard: $shownCard';
  }
}
