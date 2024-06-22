// Ini adalah tes widget Flutter dasar.
//
// Untuk melakukan interaksi dengan widget dalam pengujian Anda, gunakan WidgetTester
// utilitas dalam paket flutter_test. Misalnya, Anda dapat mengirim ketuk dan gulir
// isyarat. Anda juga dapat menggunakan WidgetTester untuk menemukan widget anak di widget
// pohon, membaca teks, dan memverifikasi bahwa nilai properti widget sudah benar.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:meditation_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Bangun aplikasi kami dan picu bingkai.
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa penghitung kami dimulai dari 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Ketuk ikon '+' dan picu bingkai.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifikasi bahwa penghitung kami telah bertambah.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
