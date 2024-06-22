import 'package:flutter/material.dart';
//Mengimpor pustaka Material Design dari Flutter untuk
//menggunakan warna dan widget lainnya.
import 'package:meditation_app/features/home/model/recommendation_model.dart';
//Mengimpor RecommendationModel dari paket meditation_app.

class RecommendationsData {
  //digunakan untuk menyimpan data rekomendasi sesi meditasi.
  static RecommendationModel mindfulMoments = RecommendationModel(
    title: 'Mindful Moments',
    color: Colors.blue,
    duration: '10 to 20 min',
    slogan:
        "The goal is to become more aware of \n your thoughts and emotions how...",
    author: "Aggam Agrawal",
    song: 'assets/songs/deep-meditation-1.mp3',
  );

  static RecommendationModel zenHarmony = RecommendationModel(
    title: 'Zen Harmony',
    color: Colors.green,
    duration: '15 to 20 min',
    slogan:
        "Find inner peace and balance in the harmony of the present moment...",
    author: "Serena Tran",
    song: '',
  );

  static RecommendationModel serenitySessions = RecommendationModel(
    title: 'Serenity Sessions',
    color: Colors.purple,
    duration: '20 to 25 min',
    slogan:
        "Immerse yourself in tranquil sessions to discover inner serenity...",
    author: "Elena Rodriguez",
    song: '',
  );

  static RecommendationModel calmOasis = RecommendationModel(
    title: 'Calm Oasis',
    color: Colors.brown,
    duration: '10 to 15 min',
    slogan: "Step into a calm oasis to rejuvenate your mind and spirit...",
    author: "Michael Chen",
    song: '',
  );

  static RecommendationModel eternalBliss = RecommendationModel(
    title: 'Eternal Bliss',
    color: Colors.pink,
    duration: '25 to 30 min',
    slogan: "Experience eternal bliss as you connect with your inner self...",
    author: "Sophie Williams",
    song: '',
  );

  static RecommendationModel tranquilSunset = RecommendationModel(
    title: 'Tranquil Sunset',
    color: Colors.orange,
    duration: '15 to 20 min',
    slogan: "Relax and unwind in the peaceful glow of a tranquil sunset...",
    author: "Aiden Thompson",
    song: '',
  );

  static List<RecommendationModel> all = [
    mindfulMoments,
    zenHarmony,
    serenitySessions,
    calmOasis,
    eternalBliss,
    tranquilSunset,
  ];
}
//List ini menyusun semua rekomendasi sesi meditasi yang tersedia dalam satu tempat.
