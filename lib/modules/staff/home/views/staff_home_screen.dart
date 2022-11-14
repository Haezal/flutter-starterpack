import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starterpack/models/models.dart';
import 'package:starterpack/providers/auth.dart';
import 'package:starterpack/providers/providers.dart';
import 'package:starterpack/views/login_screen.dart';
import 'package:starterpack/widgets/common.dart';

class StaffHomeScreen extends StatefulWidget {
  StaffHomeScreen({Key? key}) : super(key: key);

  @override
  _StaffHomeScreenState createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    AuthProvider auth = Provider.of<AuthProvider>(context);
    var doLogout = () {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.question,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Logout',
        desc: 'Are you sure?',
        btnCancelOnPress: () {},
        btnOkText: 'Proceed',
        btnOkOnPress: () {
          auth.logout();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen(),
            ),
          );
        },
      )..show();
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('UM Touch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.name ?? ''),
              SizedBox(height: 15),
              Text(user.email ?? ''),
              SizedBox(height: 15),
              longButtons('Logout', doLogout),
            ],
          ),
        ),
      ),
    );
  }
}
