import 'package:flutter/material.dart'; //untuk menggunakan widget Material Design.
import 'package:lottie/lottie.dart'; //untuk menggunakan animasi Lottie.
import 'package:meditation_app/features/home/screens/home.dart'; //Mengimpor layar utama dari aplikasi meditasi.

class OnBoardingScreen extends StatefulWidget {
  //sebuah StatefulWidget yang mendefinisikan layar pengenalan.

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
  //State kelas untuk OnBoardingScreen yang mengatur tampilan dan logika dari layar pengenalan.
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //Latar belakang dengan gradien warna biru.
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo.shade800,
                  Colors.indigoAccent.shade200,
                  Colors.indigoAccent.shade200,
                ],
              ),
            ),
          ),
          const Positioned(
            //Menampilkan teks sambutan di tengah layar.
            top: 200,
            left: 0,
            right: 0,
            child: Text(
              "Welcome To\nMeditation Centre",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(),
          Positioned(
            bottom: 0,
            left: -10,
            right: -10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.9),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    2000,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 300),
                  FractionallySizedBox(
                    widthFactor: .6,
                    child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        },
                        child: const Text("GET STARTED")),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Positioned(
            //Menampilkan animasi Lottie di bagian bawah layar.
            bottom: 120,
            left: 0,
            right: 0,
            child: Lottie.asset('assets/lottie/yoga2.json'),
          ),
        ],
      ),
    );
  }
}
