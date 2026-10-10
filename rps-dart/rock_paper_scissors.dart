import 'dart:io';

/// Gets a player's name and uses a default name when the input is empty or null.
String getPlayerName(String defaultName) {
  stdout.write('Enter $defaultName name: ');
  String? input = stdin.readLineSync();

  String name = input?.trim() ?? '';

  if (name.isEmpty) {
    print('(No name entered. Using "$defaultName".)');
    return defaultName;
  }

  return name;
}

/// Checks a move and returns it in lowercase if valid; otherwise returns null.
String? validateMove(String? input) {
  const List<String> validMoves = ['rock', 'paper', 'scissors'];

  if (input == null) {
    return null;
  }

  String move = input.trim().toLowerCase();

  if (validMoves.contains(move)) {
    return move;
  }

  return null;
}

/// Gets a valid move from a player and keeps asking until the input is valid.
String getMove(String playerName) {
  while (true) {
    stdout.write(
      '$playerName, enter your move (rock/paper/scissors): ',
    );

    String? input = stdin.readLineSync();
    String? validMove = validateMove(input);

    if (validMove != null) {
      return validMove;
    }

    print('Invalid move. Please type rock, paper, or scissors.');
  }
}

/// Decides the winner of a round and returns null when the round is a draw.
String? decideWinner(
  String playerOneMove,
  String playerTwoMove,
  String playerOneName,
  String playerTwoName,
) {
  if (playerOneMove == playerTwoMove) {
    return null;
  }

  switch (playerOneMove) {
    case 'rock':
      return playerTwoMove == 'scissors' ? playerOneName : playerTwoName;

    case 'paper':
      return playerTwoMove == 'rock' ? playerOneName : playerTwoName;

    case 'scissors':
      return playerTwoMove == 'paper' ? playerOneName : playerTwoName;

    default:
      return null;
  }
}

/// Prints the current score of both players.
void showScore(
  String playerOneName,
  String playerTwoName,
  int playerOneScore,
  int playerTwoScore,
) {
  print(
    'Score -> $playerOneName: $playerOneScore | '
    '$playerTwoName: $playerTwoScore',
  );
}

/// Prints about 30 blank lines to hide Player 1's move from Player 2.
void hidePlayerOneMove() {
  for (int i = 0; i < 30; i++) {
    print('');
  }
}

/// Plays one round and returns the winning player's name or null for a draw.
String? playRound(
  int roundNumber,
  String playerOneName,
  String playerTwoName,
) {
  print('--- Round $roundNumber ---');

  String playerOneMove = getMove(playerOneName);

  hidePlayerOneMove();

  String playerTwoMove = getMove(playerTwoName);

  print('');
  print(
    '$playerOneName chose $playerOneMove. '
    '$playerTwoName chose $playerTwoMove.',
  );

  String? winner = decideWinner(
    playerOneMove,
    playerTwoMove,
    playerOneName,
    playerTwoName,
  );

  print('Result: ${winner ?? "It\'s a draw!"}');

  return winner;
}

/// Runs the complete two-player Rock, Paper, Scissors game.
void main() {
  print(' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print('|    ROCK, PAPER, SCISSORS      |');
  print(' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print('');

  String playerOneName = getPlayerName('Player 1');
  String playerTwoName = getPlayerName('Player 2');

  int playerOneScore = 0;
  int playerTwoScore = 0;
  int roundNumber = 1;

  String playAgain;

  do {
    print('');

    String? winner = playRound(
      roundNumber,
      playerOneName,
      playerTwoName,
    );

    if (winner == playerOneName) {
      playerOneScore++;
    } else if (winner == playerTwoName) {
      playerTwoScore++;
    }

    showScore(
      playerOneName,
      playerTwoName,
      playerOneScore,
      playerTwoScore,
    );

    print('');
    stdout.write('Play again? (y/n): ');

    String? answer = stdin.readLineSync();
    playAgain = (answer ?? '').trim().toLowerCase();

    while (playAgain != 'y' && playAgain != 'n') {
      stdout.write('Please enter y or n: ');

      String? retryAnswer = stdin.readLineSync();
      playAgain = (retryAnswer ?? '').trim().toLowerCase();
    }

    roundNumber++;
  } while (playAgain == 'y');

  print('');
  print('>>>>>>>>>> FINAL SCORE <<<<<<<<<<');
  print(
    '$playerOneName: $playerOneScore | '
    '$playerTwoName: $playerTwoScore',
  );

  if (playerOneScore > playerTwoScore) {
    print('Overall winner: $playerOneName');
  } else if (playerTwoScore > playerOneScore) {
    print('Overall winner: $playerTwoName');
  } else {
    print('Overall winner: It\'s a draw!');
  }
}
