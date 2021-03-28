import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/pages/categorylistpage.dart';
import 'package:orilla_fresca_app/pages/detailspage.dart';
import 'package:orilla_fresca_app/pages/mappage.dart';
import 'package:orilla_fresca_app/pages/onboardingpage.dart';
import 'package:orilla_fresca_app/pages/selectedcategorypage.dart';
import 'package:orilla_fresca_app/pages/splashpage.dart';
import 'package:orilla_fresca_app/pages/welcomepage.dart';
import 'package:orilla_fresca_app/services/categoryselectionservice.dart';
import 'package:orilla_fresca_app/services/loginservice.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => LoginService()
        ),
        Provider(
          create: (_) => CategorySelectionService()
        )
      ],
      child: MaterialApp(
        
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: WelcomePage()),
          '/welcomepage': (context) => WelcomePage(),
          '/categorylistpage': (context) => CategoryListPage(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
          '/mappage': (context) => MapPage(),
          '/onboardingpage': (context) => OnboardingPage(),
        },
        
      )
    )
  );
}



