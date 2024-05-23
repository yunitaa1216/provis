import 'package:flutter/material.dart';
import 'package:prak_provis/view/login/login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25),
              BlendMode.srcOver, // Sesuaikan mode blend yang diinginkan
            ),
            child: Image.asset(
              'assets/images/login_register.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
