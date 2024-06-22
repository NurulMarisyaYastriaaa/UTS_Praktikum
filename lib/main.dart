import 'package:flutter/material.dart'; //untuk menggunakan widget Material.
import 'package:meditation_app/features/onboarding/screens/onboarding.dart';
//Mengimpor layar onboarding dari fitur onboarding.

//titik masuk utama untuk aplikasi Flutter. Ini memanggil fungsi runApp dan mengoper
//widget MyApp sebagai root widget aplikasi.
void main() {
  runApp(const MyApp());
}

//MyApp adalah sebuah StatelessWidget yang merepresentasikan root dari aplikasi Flutter.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //Konstruktor ini menginisialisasi MyApp dengan key yang digunakan untuk
  //identifikasi widget unik dalam pohon widget.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //debugShowCheckedModeBanner: false: Menghilangkan banner debug yang biasanya muncul di sudut kanan atas layar.
      title: 'Flutter Demo', //title: 'Flutter Demo': Menetapkan judul aplikasi.
      theme: ThemeData(
        //ThemeData: Mendefinisikan tema aplikasi.
        colorScheme: ColorScheme.fromSeed(
          //colorScheme: Menggunakan ColorScheme.fromSeed dengan seedColor berwarna Colors.
          //indigoAccent untuk menghasilkan skema warna berdasarkan warna benih tersebut.
          seedColor: Colors.indigoAccent,
        ),
        useMaterial3:
            true, //useMaterial3: true: Menggunakan elemen desain Material Design 3.
      ),
      home:
          const OnBoardingScreen(), //home: const OnBoardingScreen(): Menetapkan layar
      //onboarding (OnBoardingScreen) sebagai layar utama (home) aplikasi.
    );
  }
}
