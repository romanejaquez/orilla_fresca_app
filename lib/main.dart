import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/pages/splashpage.dart';
import 'package:orilla_fresca_app/pages/welcomepage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Raleway'),
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: WelcomePage())
  ));
}



