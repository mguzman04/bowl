import 'package:test/test.dart';
import 'package:bowl/bowling_game.dart';

void main() {
  late BowlingGame newGame;

  setUp(() {
    newGame = BowlingGame();
  });

  rollMany(int pins, int rolls) {
    for (int i = 0; i < rolls; i++) {
      newGame.roll(pins);
    }
  }

  group('Simple use cases', () {
    test('test gutterball game', () {
      rollMany(0, 20);
      expect(newGame.score(), equals(0));
    });
    test('test 1 pin per roll game', () {
      rollMany(1, 20);

      expect(newGame.score(), equals(20));
    });
  });

  test('roll one spare', () {
    rollMany(5, 2);
    newGame.roll(3);
    rollMany(0, 17);
    expect(newGame.score(), 16);
  });
}
