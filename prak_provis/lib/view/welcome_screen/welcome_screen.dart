import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:prak_provis/view/login/login_view.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/welcomescreen.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 45.0),
                    child: Stack(
                      children: <Widget>[
                        // Stroked text as a background
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                          child: Text(
                            'PULIH',
                            textAlign: TextAlign.center,
                           style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Color(0xFF3C96E9), // Warna stroke yang diinginkan
                              ),
                            ),
                          ),

                        Text(
                          'PULIH',
                          textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Expanded(child: SizedBox()),
                GlassContainer(
                  width: 300,
                  height: 50,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: Color(0xFFFFFFFF),
                  borderWidth: 1,
                  blur: 10,
                  alignment: Alignment.center,
                  frostedOpacity: 0.1,
                  color: Color(0xFF3C96E9),
                  child: MaterialButton(
                      onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
                    },
                    child: Text(
                      'MASUK',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:'Raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}