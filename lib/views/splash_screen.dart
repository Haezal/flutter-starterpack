import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starterpack/config/config.dart';
import 'package:starterpack/models/models.dart';
import 'package:starterpack/modules/staff/home/views/views.dart';
import 'package:starterpack/modules/student/home/views/views.dart';
import 'package:starterpack/providers/providers.dart';
import 'package:starterpack/views/views.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  checkUserLogin() async {
    await Future.delayed(Duration(seconds: 1));
    User user = await UserPreferences().getUser();

    if (user.token == '') {
      // dont have token, redirect to login page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
      );
    } else {
      // have token, set user and redirect to welcome screen
      Provider.of<UserProvider>(context, listen: false).setUser(user);

      /**
       * Control navigation screen by userType
       */
      if (user.userType == Constants.STAFF) {
        // STAFF
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => StaffHomeScreen(),
          ),
        );
      } else if (user.userType == Constants.STUDENT) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => StudentHomeScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
