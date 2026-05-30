import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static bool isEnabled = true;
  static AudioPlayer? _correctPlayer;
  static AudioPlayer? _wrongPlayer;

  // Initialize and preload sounds
  static Future<void> init() async {
    _correctPlayer = AudioPlayer();
    _wrongPlayer = AudioPlayer();
    await _correctPlayer!.setSource(AssetSource('sounds/correct.mp3'));
    await _wrongPlayer!.setSource(AssetSource('sounds/wrong.mp3'));
    print('SoundService initialized');
  }

  static void setEnabled(bool enabled) {
    isEnabled = enabled;
  }

  static Future<void> playCorrect() async {
    if (!isEnabled) return;
    try {
      await _correctPlayer?.stop();
      await _correctPlayer?.resume();
      await _correctPlayer?.play(AssetSource('sounds/correct.mp3'));
    } catch (e) {
      print('Correct sound error: $e');
      // Fallback: create a temporary player
      final temp = AudioPlayer();
      await temp.play(AssetSource('sounds/correct.mp3'));
    }
  }

  static Future<void> playWrong() async {
    if (!isEnabled) return;
    try {
      await _wrongPlayer?.stop();
      await _wrongPlayer?.resume();
      await _wrongPlayer?.play(AssetSource('sounds/wrong.mp3'));
    } catch (e) {
      print('Wrong sound error: $e');
      final temp = AudioPlayer();
      await temp.play(AssetSource('sounds/wrong.mp3'));
    }
  }
}
