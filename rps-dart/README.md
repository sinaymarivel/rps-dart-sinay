# IT 120 Laboratory Activity
## Two-Player Rock, Paper, Scissors in Dart

**Name:** Marivel Charisse  
**Course/Year/Section:** __________________________

### Description

This is a console-based two-player Rock, Paper, Scissors game written in Dart.
Player 1 and Player 2 enter their names and choose rock, paper, or scissors.
The program validates the moves, determines the winner, keeps the score, and
allows the players to play additional rounds.

### Requirements Used

- `dart:io` for keyboard input and output
- Nullable `String?` variables for user input
- Null-aware operators such as `??`
- `String?` return value for move validation
- `String? winner` for a possible draw
- `List<String>` and `.contains()`
- `.trim()` and `.toLowerCase()`
- Multiple focused functions
- `switch` statement for winner logic
- `for` loop for approximately 30 blank lines
- `do-while` loop for the play-again feature
- String interpolation for output containing variables
- Documentation comments (`///`) above functions

### How to Run

Open the project folder in VS Code.

In the terminal, run:

```bash
dart rock_paper_scissors.dart
```

DartPad should not be used for this activity because the program requires
keyboard input through `stdin`.

### Suggested Git Commits

Use at least three commits:

```bash
git add .
git commit -m "Add Rock Paper Scissors game"
```

```bash
git add .
git commit -m "Add move validation and null safety"
```

```bash
git add .
git commit -m "Add README and improve game flow"
```

### GitHub Repository

Repository name:

```text
rps-dart-yourlastname
```

Make the repository public and submit the repository link.

### Testing

The game was tested with different player names and moves. It checks valid and invalid inputs, determines the round winner, updates the score, and displays the final winner.