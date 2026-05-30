class SoundService {
  static bool isEnabled = true;

  static void setEnabled(bool enabled) {
    isEnabled = enabled;
  }

  static Future<void> init() async {
    // No-op
  }

  static Future<void> playCorrect() async {
    // No-op
  }

  static Future<void> playWrong() async {
    // No-op
  }
}
