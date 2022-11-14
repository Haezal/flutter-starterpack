// import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starterpack/config/config.dart';
import 'package:starterpack/modules/staff/home/views/staff_home_screen.dart';
import 'package:starterpack/modules/student/home/views/student_home_screen.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();

  FocusNode _usernameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  String _username = '';
  String _password = '';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      focusNode: _usernameFocusNode,
      autofocus: false,
      validator: validateEmail,
      // validator: (value) => value.isEmpty ? "Please enter email address" : null,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
      onSaved: (value) => _username = value ?? '',
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      decoration: buildInputDecorationWithIcon("Email address", "Enter your email address", Icons.person),
    );

    final passwordField = TextFormField(
      focusNode: _passwordFocusNode,
      autofocus: false,
      obscureText: _obscureText,
      validator: (value) => value == '' ? "Please enter password" : null,
      onSaved: (value) => _password = value ?? '',
      decoration: buildInputDecorationWithIconAndSuffix(
        "Password",
        "Enter your Password",
        Icons.lock,
        new GestureDetector(
          onTap: () {
            setState(() => _obscureText = !_obscureText);
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(),
        ),
        Text(" Authenticating ... Please wait")
      ],
    );

    var doLogin = () {
      final form = formKey.currentState!;

      print(form);

      if (formKey.currentState!.validate()) {
        form.save();
        try {
          final Future<Map<String, dynamic>> loginMessage = auth.login(_username, _password);
          loginMessage.then((response) {
            // login successful
            if (response['success'] == true) {
              User user = response['user'];
              Provider.of<UserProvider>(context, listen: false).setUser(user);

              // navigate page base on user type
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
            } else {
              errorFlushbar('Login failed', response['message']).show(context);
            }
          });
        } catch (e) {
          errorFlushbar('Exception', e.toString()).show(context);
        }
      } else {
        print('Form is invalid');
      }
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Visibility(
              //   visible: Provider.of<DataConnectionStatus>(context) == DataConnectionStatus.disconnected,
              //   child: InternetNotAvailable(),
              // ),
              SizedBox(height: 15.0),
              // label('Email Address'),
              usernameField,
              SizedBox(height: 15.0),
              // label('Password'),
              passwordField,
              SizedBox(height: 15.0),
              auth.loggedInStatus == Status.Authenticating ? loading : longButtons("Login", doLogin),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
