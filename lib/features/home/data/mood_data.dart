import 'package:meditation_app/features/home/model/mood_model.dart';
//Baris ini mengimpor MoodModel dari paket meditation_app.
//MoodModel ini kemungkinan adalah sebuah model data yang
//digunakan untuk menyimpan informasi tentang mood.

class MoodData {
  //Kelas MoodData ini adalah sebuah kelas statis yang digunakan untuk menyimpan data mood.
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
//Di sini, kita mendefinisikan enam objek MoodModel statis, masing-masing
//dengan nama dan ikon yang berbeda. Misalnya, objek tenang memiliki nama
//'Tenang' dan ikon yang terletak di assets/icons/calm.png.

  static List<MoodModel> moods = [
    tenang,
    rohani,
    fokus,
    alam,
    pagi,
    penyembuhan,
  ];
}
//Variabel moods adalah sebuah list yang berisi objek-objek MoodModel yang
//sudah didefinisikan sebelumnya. List ini menyusun semua mood yang
//tersedia dalam urutan tertentu.
