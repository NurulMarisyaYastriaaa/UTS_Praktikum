import 'dart:math'; //untuk menggunakan fungsi acak.

import 'package:flutter/material.dart'; //untuk menggunakan widget Material Design.
import 'package:meditation_app/features/home/model/recommendation_model.dart';
import 'package:meditation_app/features/player/screens/player.dart';
//Mengimpor model rekomendasi dan layar pemutar dari aplikasi meditasi.

//sebuah StatefulWidget yang menerima satu parameter model dari tipe RecommendationModel.
class Balls extends StatefulWidget {
  const Balls({
    super.key,
    required this.model,
  });

  @override
  State<Balls> createState() => _BallsState();

  final RecommendationModel model;
}

class _BallsState extends State<Balls> {
  List<double> positions = [
    0,
    0,
    0,
    0
  ]; //positions: List yang menyimpan posisi acak untuk dua bola.

  void randomize() {
    //Fungsi ini mengatur posisi acak untuk dua bola.
    positions[0] = Random().nextInt(100) + 80;
    positions[1] = Random().nextInt(150) - 50;
    positions[2] = Random().nextInt(100) + 80;
    positions[3] = Random().nextInt(150) - 50;
  }

  initMoment() async {
    //Fungsi ini memanggil randomize dan memperbarui UI setiap 3 detik secara rekur
    if (mounted && context.mounted) {
      randomize();

      setState(() {});
    }
    await Future.delayed(const Duration(seconds: 3));
    if (mounted && context.mounted) {
      initMoment();
    }
  }

  @override
  void initState() {
    //Inisialisasi posisi acak saat widget pertama kali dibangun dan memulai animasi.
    super.initState();
    randomize();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      randomize();
      setState(() {});
      initMoment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //Membuat kontainer dengan sudut melingkar.
      borderRadius: BorderRadius.circular(40),
      child: Container(
        //Kontainer utama dengan lebar 170 dan warna latar belakang sesuai model.
        width: 170,
        decoration: BoxDecoration(
          color: widget.model.color.shade300,
        ),
        child: Stack(
          //Menumpuk beberapa widget di atas satu sama lain.
          children: [
            AnimatedPositioned(
              //Mengatur posisi animasi dua bola yang bergerak secara acak setiap 3 detik.
              duration: const Duration(seconds: 3),
              top: positions[0],
              right: positions[1],
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.model.color,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              bottom: positions[2],
              left: positions[3],
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.model.color,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //Menampilkan judul dan durasi rekomendasi meditasi.
                    widget.model.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    'course',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.model.duration,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        //Mengarahkan ke layar pemutar saat tombol play ditekan.
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PlayerScreen(model: widget.model),
                            ),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/play.png',
                            height: 30,
                            width: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
