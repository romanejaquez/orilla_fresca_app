import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/models/loginusermodel.dart';
import 'package:orilla_fresca_app/services/loginservice.dart';
import 'package:provider/provider.dart';

class UserProfileHeader extends StatelessWidget {

  bool? showProfilePic;

  UserProfileHeader({
    this.showProfilePic
  });

  @override
  Widget build(BuildContext context) {

    return Consumer<LoginService>(
      builder: (context, loginService, child) {
        LoginUserModel? userModel = loginService.loggedInUserModel;

        String? imgPath = userModel != null ? userModel.photoUrl : '';
        
        return this.showProfilePic! && imgPath!.length > 0 ? 
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10),
            child: ClipOval(
              child: Image.network(imgPath)
            )
          ): SizedBox(width: 40, height: 40);
      },
    );
  }
}