import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/appcolors.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: AppColors.MAIN_COLOR,
                ),
                SizedBox(width: 10),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize:  25,
                    fontWeight: FontWeight.bold
                  )
                )
              ],
            ),
            Expanded(
              child: Container(),
            )
          ]
        )
    );
  }
}