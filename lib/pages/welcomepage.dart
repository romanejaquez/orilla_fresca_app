import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/appcolors.dart';
import 'package:orilla_fresca_app/helpers/iconhelper.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/services/loginservice.dart';
import 'package:orilla_fresca_app/widgets/iconfont.dart';
import 'package:orilla_fresca_app/widgets/themebutton.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                'assets/imgs/of_main_bg.png',
                fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: AppColors.MAIN_COLOR,
                        alignment: Alignment.center,
                        child: IconFont(
                          iconName: IconFontHelper.MAIN_LOGO,
                          color: Colors.white,
                          size: 130
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text('Bienvenido/a',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 40),
                  Text('Productos Frescos.\nSaludables. A Tiempo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    )
                  ),
                  SizedBox(height: 40),
                  ThemeButton(
                    label: 'Tratar Ahora!',
                    highlight: Colors.green[900],
                    color: AppColors.MAIN_COLOR,
                    onClick: () {
                      Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                    },
                  ),
                  ThemeButton(
                    label: 'Hacer Onboarding',
                    highlight: Colors.green[900],
                    color: AppColors.DARK_GREEN,
                    onClick: () {
                      Utils.mainAppNav.currentState!.pushNamed('/onboardingpage');
                    },
                  ),
                  ThemeButton(
                    label: "Hacer Login",
                    labelColor: AppColors.MAIN_COLOR,
                    color: Colors.transparent,
                    highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                    borderColor: AppColors.MAIN_COLOR,
                    borderWidth: 4,
                    onClick: () async {
                      bool success = await loginService.signInWithGoogle();

                      if (success) {
                        Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                      }
                    }
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}