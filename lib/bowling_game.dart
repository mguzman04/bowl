class BowlingGame {
  List<int> rolls = List.filled(21, 0);
  int currentRoll = 0;

  int _sumOfBallsInFrame(int frameIndex) {
    return rolls[frameIndex] + rolls[frameIndex + 1];
  }

  roll(int pins) {
    rolls[currentRoll] = pins;
    currentRoll++;
  }

  bool isSpare(int frameIndex) {
    return rolls[frameIndex] + rolls[frameIndex + 1] == 10;
  }

  int score() {
    int total = 0;
    int frameIndex = 0;
    for (int frame = 0; frame < 10; frame++) {
      if (isStrike(frameIndex)) {
        total += 10 + _strikeBonus(frameIndex);
        frameIndex++;
      } else if (isSpare(frameIndex)) {
        total += 10 + _spareBonus(frameIndex);
        frameIndex += 2;
      } else {
        total += _sumOfBallsInFrame(frameIndex);
        frameIndex += 2;
      }
    }
    return total;
  }

  bool isStrike(int frameIndex) => rolls[frameIndex] == 10;

  int _strikeBonus(int frameIndex) =>
      rolls[frameIndex + 1] + rolls[frameIndex + 2];

  int _spareBonus(int frameIndex) => rolls[frameIndex + 2];
}
