import 'package:flutter/material.dart';
import 'package:prak_provis/view/login/login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_register.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 262,
                  ),
                  LoginWidget(),
                  SizedBox(height: 135),
                  DonTHaveAnAccountSignUp(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
