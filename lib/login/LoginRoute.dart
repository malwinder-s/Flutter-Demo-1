import 'package:flutter/material.dart';
import 'package:flutter_app_demo_1/home/HomeRoute.dart';
import 'package:flutter_app_demo_1/view/ButtonStyles.dart';
import 'package:flutter_app_demo_1/widgets/InputField.dart';

class LoginRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginRouteState();
  }
}

class LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/google_icon.png'),
              width: 60,
              height: 60,
            ),
            InputField(
              hintText: "Username",
            ),
            InputField(
              isPassword: true,
              hintText: "Password",
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: OutlinedButton(
                style: outlineButtonStyle(context),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeRoute()),
                  );
                },
                child: Text('Sign In'),
              ),
            ),
            // Center(child: FetchAlbum())
          ],
        ),
      ),
    ));
  }
}
