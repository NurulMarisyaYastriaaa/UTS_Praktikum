import 'package:meditation_app/features/home/model/mood_model.dart';

class MoodData {
  static MoodModel tenang =
      MoodModel(name: 'Tenang', icon: 'assets/icons/calm.png');
  static MoodModel fokus =
      MoodModel(name: 'Fokus', icon: 'assets/icons/focus.png');
  static MoodModel penyembuhan =
      MoodModel(name: 'Penyembuhan', icon: 'assets/icons/healing.png');
  static MoodModel pagi =
      MoodModel(name: 'Pagi', icon: 'assets/icons/morning.png');
  static MoodModel alam =
      MoodModel(name: 'Alam', icon: 'assets/icons/nature.png');
  static MoodModel rohani =
      MoodModel(name: 'Rohani', icon: 'assets/icons/spiritual.png');

  static List<MoodModel> moods = [
    tenang,
    rohani,
    fokus,
    alam,
    pagi,
    penyembuhan,
  ];
}
