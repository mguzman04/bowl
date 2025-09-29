class BowlingGame {
  List<int> rolls = [];
  int currentRoll = 0;

  roll(int pins) {
    rolls.add(pins);
  }

  int score() {
    int total = 0;
    int i = 0;
    for (int frame = 0; frame < 10; frame++) {
      if (rolls[i] + rolls[i + 1] == 10) {
        total += 10 + rolls[i + 2];
        i += 2;
      } else {
        total += rolls[i] + rolls[i + 1];
        i += 2;
      }
    }
    return total;
  }
}
