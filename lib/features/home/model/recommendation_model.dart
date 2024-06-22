import 'package:flutter/material.dart';

class RecommendationModel {
  //Kelas ini digunakan untuk membuat objek yang merepresentasikan
//sesi meditasi, yang memiliki beberapa properti: title, color, duration, slogan, author, dan song.

  final String title;
  final MaterialColor color;
  final String duration;
  final String slogan;
  final String author;
  final String song;

  RecommendationModel({
    //Konstruktor ini digunakan untuk menginisialisasi objek
    //RecommendationModel dengan enam parameter:
    required this.title,
    required this.color,
    required this.duration,
    required this.slogan,
    required this.author,
    required this.song,
  });
}
