import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/pages/detailspage.dart';
import 'package:orilla_fresca_app/pages/mainpage.dart';
import 'package:orilla_fresca_app/pages/mappage.dart';
import 'package:orilla_fresca_app/pages/onboardingpage.dart';
import 'package:orilla_fresca_app/pages/selectedcategorypage.dart';
import 'package:orilla_fresca_app/pages/splashpage.dart';
import 'package:orilla_fresca_app/pages/welcomepage.dart';
import 'package:orilla_fresca_app/services/cartservice.dart';
import 'package:orilla_fresca_app/services/categoryselectionservice.dart';
import 'package:orilla_fresca_app/services/categoryservice.dart';
import 'package:orilla_fresca_app/services/loginservice.dart';
import 'package:provider/provider.dart';

import 'helpers/utils.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginService()
        ),
        ChangeNotifierProvider(
          create: (_) => CategorySelectionService()
        ),
        ChangeNotifierProvider(
          create: (_) => CartService()
        ),
        Provider(
          create: (_) => CategoryService()
        )
      ],
      child: MaterialApp(
        navigatorKey: Utils.mainAppNav,
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: '/welcomepage'),
          '/welcomepage': (context) => WelcomePage(),
          '/mainpage': (context) => MainPage(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
          '/mappage': (context) => MapPage(),
          '/onboardingpage': (context) => OnboardingPage(),
        },
        
      )
    )
  );
}



