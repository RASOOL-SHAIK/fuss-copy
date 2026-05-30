import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static bool isEnabled = true;

  static void setEnabled(bool enabled) {
    isEnabled = enabled;
  }

  // No init needed, we'll create fresh players each time
  static Future<void> playCorrect() async {
    if (!isEnabled) return;
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('sounds/correct.mp3'));
    } catch (e) {
      print('Error playing correct: $e');
    }
  }

  static Future<void> playWrong() async {
    if (!isEnabled) return;
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('sounds/wrong.mp3'));
    } catch (e) {
      print('Error playing wrong: $e');
    }
  }
}
