import 'package:flutter/material.dart';
import 'package:prak_provis/view/register/register.dart';

import '../../model/login_model/model_login.dart';
import '../../model/utils/auth_service.dart';
import '../../viewmodel/api_login/login_api.dart';
// import '../../viewmodel/api_login/login_api.dart';

class DonTHaveAnAccountSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Belum punya akun?",
          style: TextStyle(
            color: Color(0xFFF9F5F6),
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ),
              );
            },
            child: const Text(
              'Daftar',
              style: TextStyle(
                color: Color(0xFF3C96E9),
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ))
      ],
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Menentukan apakah password terlihat atau tidak
  String _massageError = '';

  final LoginViewModel _loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 377,
          height: 370,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        color: Color(0xFFF9F5F6),
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 6),
                    const Text(
                      'Masukkan Email dan Password',
                      style: TextStyle(
                        color: Color(0xFFF9F5F6),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 68,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 250,
                                  height: 28,
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Masukkan Email",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, // Warna teks hint
                                          fontFamily: 'Raleway',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black, // Warna teks input
                                      fontFamily: 'Raleway',
                                      // Ganti dengan font family yang diinginkan
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    if (_massageError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          'Email $_massageError',
                          style: const TextStyle(
                            color: Color(0xFF3C96E9),
                            fontSize: 12,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Container(
                      // width: double.infinity,
                      height: 68,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 345,
                                  height: 28,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Masukkan Password",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Raleway',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      suffixIcon: IconButton(
                                        padding: EdgeInsets.only(
                                            top: 2, bottom: 2, left: 18),
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                          // size: 25,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_massageError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Password $_massageError',
                          style: const TextStyle(
                            color: Color(0xFF3C96E9),
                            fontSize: 12,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 48,
                decoration: ShapeDecoration(
                  color: const Color(0xFF3C96E9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    LoginData loginData =
                        LoginData(email: email, password: password);
                    _loginViewModel.loginUser(loginData).then((loginResponse) {
                        if (loginResponse.sucess == true) {
                        print('ke halaman homepage');
                        AuthService.token = loginResponse.token;
                        Navigator.pushReplacementNamed(context, "/homepage");
                      } else {
                        // Tampilkan pesan kesalahan jika login gagal
                        setState(() {
                          _massageError = 'salah';
                        });
                      }
                    });
                        // String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJzb3NvQGdtYWlsLmNvbSIsImlhdCI6MTcxMzc5OTc1Nn0.cqsYnhTquP1-9aul9LI-mId2doMeY03ZG0twA6DghSI';
                        // Navigator.pushReplacementNamed(context, "/homepage");
                        // AuthService.token = token;
                  },
                child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Text(
                        'Masuk',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}