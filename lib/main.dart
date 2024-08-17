import 'package:flutter/material.dart';
import 'package:kur_donusturucu/ana_uygulama.dart';

void main() {
  runApp(AnaSayfa());
}
class AnaSayfa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaUygulama(),
      debugShowCheckedModeBanner: false,
    );
  }
}

