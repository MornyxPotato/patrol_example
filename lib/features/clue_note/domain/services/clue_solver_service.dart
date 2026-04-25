import 'package:get/get.dart';
import 'package:patrol_example/features/clue_note/domain/constants/card_data_list.dart';
import 'package:patrol_example/features/clue_note/domain/entities/clue_constraint.dart';
import 'package:patrol_example/features/clue_note/domain/entities/suggestion_response.dart';
import 'package:patrol_example/features/clue_note/domain/enums/card_state.dart';
import 'package:patrol_example/features/clue_note/domain/enums/response_type.dart';
import 'package:patrol_example/features/clue_note/presentation/controllers/clue_controller.dart';

class ClueSolverService {
  List<String> players = [];
  List<String> allCard = [];

  // The knowledge grid: Map<PlayerName, Map<CardName, CardState>>
  final Map<String, Map<String, CardState>> board = {};

  // List to hold "Player has at least one of these cards" rules
  final List<ClueConstraint> constraints = [];

  void initGame(int playerCount) {
    // Initialize the board with 'unknown' for everyone, plus the 'Envelope'
    players = List.generate(playerCount, (i) => 'Player ${i + 1}');
    List<String> columns = [...players, 'Envelope'];
    List<String> allCards = [...weaponList, ...murdererList, ...crimeSceneList];

    for (var col in columns) {
      board[col] = {};
      for (var card in allCards) {
        if (col == 'Player 1') {
          board[col]![card] = CardState.no;
        } else {
          board[col]![card] = CardState.unknown;
        }
      }
    }
  }

  /// Manually set a known fact and trigger deductions
  void setFact(String playerOrEnvelope, String card, CardState state) {
    print('player is $playerOrEnvelope card is $card state is $state');
    if (board[playerOrEnvelope]![card] == state) return; // Already known

    board[playerOrEnvelope]![card] = state;

    if (state == CardState.yes) {
      // If someone has the card, NO ONE else has it.
      for (var other in board.keys) {
        if (other != playerOrEnvelope) {
          setFact(other, card, CardState.no);
        }
      }
    } else if (state == CardState.no) {
      // If we mark a 'NO', we need to check two things:
      // 1. Re-evaluate our partial knowledge constraints
      _evaluateConstraints();

      // 2. Check if everyone lacks this card. If so, it must be in the Envelope!
      if (playerOrEnvelope != 'Envelope') {
        bool allPlayersNo = players.every((p) => board[p]![card] == CardState.no);
        if (allPlayersNo) {
          setFact('Envelope', card, CardState.yes);
          print('Found $card as an answer !');
          Get.find<ClueController>().updateAnswer(card);
        }
      }
    }
  }

  /// Checks if any partial knowledge can be resolved into absolute knowledge
  void _evaluateConstraints() {
    bool madeDeduction = false;
    List<ClueConstraint> resolvedConstraints = [];

    for (var constraint in constraints) {
      int unknownCount = 0;
      String? lastUnknownCard;
      bool alreadyHasOne = false;

      for (var card in constraint.possibleCards) {
        var state = board[constraint.player]![card];
        if (state == CardState.yes) {
          alreadyHasOne = true;
          break; // Constraint is fulfilled
        } else if (state == CardState.unknown) {
          unknownCount++;
          lastUnknownCard = card;
        }
      }

      if (alreadyHasOne) {
        resolvedConstraints.add(constraint); // We can discard this rule
      } else if (unknownCount == 1 && lastUnknownCard != null) {
        // DEDUCTION: They don't have 2 of them, so they MUST have the 3rd!
        setFact(constraint.player, lastUnknownCard, CardState.yes);
        resolvedConstraints.add(constraint);
        madeDeduction = true;
      }
    }

    // Clean up resolved constraints
    constraints.removeWhere((c) => resolvedConstraints.contains(c));

    // If we made a deduction, run it again to cascade further logic
    if (madeDeduction) {
      _evaluateConstraints();
    }
  }

  /// Process a turn where a suggestion was made
  void processSuggestion({
    required String suggester,
    required List<String> suggestedCards, // The 3 cards guessed
    required List<SuggestionResponse> responses, // How the table reacted, in order
  }) {
    print('responses is $responses');
    for (var response in responses) {
      if (response.type == ResponseType.pass) {
        // Absolute No: This player definitely does NOT have any of the 3 cards
        for (var card in suggestedCards) {
          setFact(response.player, card, CardState.no);
        }
      } else if (response.type == ResponseType.showedCard) {
        // Partial or Absolute Yes: This player has at least one of the cards
        if (response.shownCard != null) {
          // We saw the exact card! Mark it as an Absolute Yes.
          setFact(response.player, response.shownCard!, CardState.yes);
        } else {
          // We didn't see it (it was shown to someone else), but we know they hold 1 of the 3.
          constraints.add(ClueConstraint(response.player, suggestedCards));
          _evaluateConstraints();
        }
      }
    }
  }
}
