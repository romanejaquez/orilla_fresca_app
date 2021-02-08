import 'package:flutter/material.dart';

import 'helpers/iconhelper.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: WelcomePage())
  ));
}

class IconFont extends StatelessWidget {
  Color color;
  double size;
  String iconName;

  IconFont({ this.color, this.size, this.iconName });

  @override 
  Widget build(BuildContext context) {
    return Text(this.iconName,
      style: TextStyle(
        color: this.color,
        fontSize: this.size,
        fontFamily: 'orilla'
      )
    );
  }
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({ this.goToPage, this.duration });

  @override 
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => this.goToPage)
      );
    });

    return Scaffold(
      body: Container(
        color: Color(0xFF80C038),
        alignment: Alignment.center,
        child: IconFont(
          color: Colors.white,
          iconName: IconFontHelper.LOGO,
          size: 100
        )
      )
    );
  }
}

class WelcomePage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Hello World!')
      )
    );
  }
}