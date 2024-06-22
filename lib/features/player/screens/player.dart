import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//untuk menggunakan widget Material dan Cupertino.
import 'package:lottie/lottie.dart'; //untuk menggunakan animasi Lottie.
import 'package:meditation_app/features/home/model/recommendation_model.dart';
//untuk mendapatkan data rekomendasi meditasi.

//sebuah StatefulWidget yang menerima model sebagai parameter untuk menampilkan informasi rekomendasi.
class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.model});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();

  final RecommendationModel model;
}

class _PlayerScreenState extends State<PlayerScreen>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin digunakan untuk animasi.
  late AnimationController
      _controller; //AnimationController mengontrol animasi.
  late Animation<double> _progress;

  //ValueNotifier<double> digunakan untuk mengontrol nilai slider pemutar.
  final ValueNotifier<double> _player = ValueNotifier<double>(0);
  bool _isDark = false; //_isDark menentukan mode tema (gelap atau terang).

  controllerListener() {
    //controllerListener: Memeriksa status animasi dan memanggil increasePlayer.
    if (_controller.status == AnimationStatus.forward ||
        _controller.status == AnimationStatus.completed) {
      increasePlayer();
    }
  }

  increasePlayer() async {
    //increasePlayer: Mengatur nilai player dan mengontrol animasi pemutar.
    if (_controller.status == AnimationStatus.forward ||
        _controller.status == AnimationStatus.completed) {
      if ((_player.value + .0005) > 1) {
        _player.value = 1;
        _controller.reverse();
      } else {
        _player.value += .00005;
      }

      await Future.delayed(
        const Duration(milliseconds: 100),
      );
      if (_player.value < 1) {
        increasePlayer();
      }
    }
  }

  @override
  void initState() {
    //Menginisialisasi AnimationController dan Animation.
    super.initState();
    _controller = AnimationController(
      //Menambahkan listener untuk mengontrol animasi dan memanggil controllerListener.
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _progress = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.addListener(() {
      controllerListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      //Material Widget: Menentukan warna latar belakang berdasarkan tema (_isDark).
      color: _isDark ? Colors.black : Colors.white,
      child: Scaffold(
        //Scaffold: Menyediakan struktur dasar untuk tampilan layar.
        backgroundColor: widget.model.color.withOpacity(.1),
        body: SingleChildScrollView(
          //SingleChildScrollView: Memungkinkan tampilan layar untuk
          //menggulung (scroll) jika konten melebihi tinggi layar.
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    highlightColor: widget.model.color.withOpacity(.2),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_backspace_rounded,
                      color: widget.model.color.shade300,
                    ),
                  ),
                  IconButton(
                    highlightColor: widget.model.color.withOpacity(.2),
                    onPressed: () {
                      setState(() {
                        _isDark = !_isDark;
                      });
                    },
                    icon: Icon(
                      _isDark
                          ? CupertinoIcons.sun_max_fill
                          : CupertinoIcons.moon_stars_fill,
                      color: widget.model.color.shade300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox.square(
                dimension: MediaQuery.sizeOf(context).width - 40,
                child: Stack(
                  children: [
                    Positioned.fill(
                      left: 30,
                      top: 30,
                      bottom: 30,
                      right: 30,
                      child: ValueListenableBuilder(
                          valueListenable: _player,
                          builder: (context, value, _) {
                            return CircularProgressIndicator(
                              color: widget.model.color.shade300,
                              value: value,
                              strokeCap: StrokeCap.round,
                              strokeWidth: 10,
                              backgroundColor:
                                  widget.model.color.withOpacity(.4),
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Container(
                          padding: const EdgeInsets.only(top: 120, left: 20),
                          height: 200,
                          width: 200,
                          color: widget.model.color.shade300,
                          child: Transform.scale(
                            scale: 3,
                            child: Lottie.asset('assets/lottie/yoga.json'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                //Text: Menampilkan judul, penulis, dan slogan dari model rekomendasi.
                widget.model.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: widget.model.color.shade300,
                ),
              ),
              Text(
                widget.model.author,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.model.color.shade300,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    highlightColor: widget.model.color.withOpacity(.2),
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      size: 50,
                      color: widget.model.color.withOpacity(.3),
                    ),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    highlightColor: widget.model.color.withOpacity(.2),
                    onPressed: () {
                      if (_controller.status == AnimationStatus.completed) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                    },
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _progress,
                      size: 50,
                      color: widget.model.color.shade300,
                    ),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    highlightColor: widget.model.color.withOpacity(.2),
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_rounded,
                      size: 50,
                      color: widget.model.color.withOpacity(.3),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: _player,
                builder: (context, value, _) {
                  return Slider(
                    //Slider: Kontrol untuk mengatur posisi pemutaran
                    thumbColor: widget.model.color.shade300,
                    activeColor: widget.model.color.shade300,
                    inactiveColor: widget.model.color.withOpacity(.4),
                    secondaryActiveColor: widget.model.color.withOpacity(.4),
                    secondaryTrackValue: .8,
                    value: value,
                    onChanged: (_) {
                      _controller.reverse();
                      _player.value = _;
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.model.slogan,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.model.color.shade300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
