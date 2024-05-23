import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/api_register/register_api.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return 
    Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: 377,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widgetForm(),
                const SizedBox(height: 30),
                //---------------------- SIGN UP BUTTON ---------------------
                Container(
                  height: 48,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3C96E9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                        var viewModel = Provider.of<RegisterViewModel>(
                              context,
                              listen: false);
                        var response = await viewModel.registerUser(
                          nama_lengkap: _nameController.text, 
                          no_hp: _phoneController.text, 
                          email: _emailController.text, 
                          kata_sandi: _passwordController.text, 
                          konfirmasi_kata_sandi: _confirmpasswordController.text, 
                          tanggal_lahir: _birthdayController.text,
                          );
                          if (response.statusCode == 200){
                            viewModel.register();
                            Navigator.pushNamed(context,'/homepage');
                          }
                          else {
                            print("Unexpected status code: ${response.statusCode}");
                          }
                        // print('Username: ${_nameController.text}');
                        // print('Phone: ${_phoneController.text}');
                        // print('Email: ${_emailController.text}');
                        // print('Password: ${_passwordController.text}');
                        // print('Birthdate: ${_birthdayController.text}');
                      }
                   catch (error) {
                          print("Error: $error");
                          if (error is DioError) {
                            print("DioError details: ${error.response?.data}");
                          }
                        }
                      }
                    },
                    child: const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Text(
                          'Daftar',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetForm() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 170),
          const Text(
            'Buat Akun',
            style: TextStyle(
              color: Color(0xFFF9F5F6),
              fontSize: 32,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 18),
              //-------------Nama Lengkap--------------
              Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                      SizedBox(height: 4),
                       Container(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          hintText: "Masukkan nama lengkap anda",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Wajib diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //------------------------ PHONE NUMBER ----------------------------
           const SizedBox(height: 12),
           Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                        'No. Hp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 4),
                Container(
                        width: double.infinity, // Ubah menjadi double.infinity agar lebar dapat menyesuaikan Expanded
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none),
                            hintText: "Masukkan no hp anda",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          controller: _phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nomor telepon wajib diisi';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Nomor telepon hanya boleh berisi angka';
                            }

                            return null;
                          },
                        ),
                      ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          //------------------------ BIRTHDATE ----------------------------
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tanggal Lahir',
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
                        child: InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: IgnorePointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Masukkan tanggal lahir anda",
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                ),
                              ),
                              controller: _birthdayController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ulang tahun wajib diisi';
                                }
                                return null;
                              },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
                      const SizedBox(height: 12),
          //------------------------ EMAIL ----------------------------
          Container(
            width: double.infinity,
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
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                            hintText: "Masukkan email anda",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat email wajib diisi';
                        }

                        // Check if the value is a valid email address
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return 'Masukkan alamat email yang valid';
                        }

                        return null;
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          //------------------------ PASSWORD ----------------------------
          Container(
            width: double.infinity,
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
                  width: double.infinity,
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        hintText: "Masukkan password anda",
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          padding: const EdgeInsets.only(),
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password wajib diisi';
                        }
                        if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                          return 'Password harus mengandung huruf besar';
                        }
                        if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                          return 'Password harus mengandung huruf kecil';
                        }
                        if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                          return 'Password harus mengandung angka';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                //--------------------------- CONFIRM PASSWORD --------------------------
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Konfirmasi Password',
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
                        child: Container(
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              hintText: "Masukkan konfirmasi password anda",
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                padding: const EdgeInsets.only(),
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            controller: _confirmpasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Konfirmasi password kosong';
                              }
                              if (value != _passwordController.text) {
                                return 'Password tidak sesuai';
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    // ]));
  }

Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthdayController.text = picked.toString().split(' ')[0];
      });
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class RegisterWidget extends StatefulWidget {
//   const RegisterWidget({Key? key}) : super(key: key);

//   @override
//   State<RegisterWidget> createState() => _RegisterWidgetState();
// }

// class _RegisterWidgetState extends State<RegisterWidget> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmpasswordController =
//       TextEditingController();
//   final TextEditingController _birthdayController = TextEditingController();
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Container(
//             width: 377,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 widgetForm(),
//                 const SizedBox(height: 30),
//                 //---------------------- SIGN UP BUTTON ---------------------
//                 Container(
//                   height: 48,
//                   decoration: ShapeDecoration(
//                     color: Color(0xFF3C96E9),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                   ),
//                   child: InkWell(
//                     onTap: () async {
//                       if (_formKey.currentState!.validate()) {
//                         // Jika validasi form berhasil, kirim data ke API
//                         await registerUser();
//                       }
//                     },
//                     child: const Center(
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//                         child: Text(
//                           'Daftar',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontFamily: 'Raleway',
//                             fontWeight: FontWeight.w700,
//                             height: 0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget widgetForm() {
//     return Container(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 170),
//           const Text(
//             'Buat Akun',
//             style: TextStyle(
//               color: Color(0xFFF9F5F6),
//               fontSize: 32,
//               fontFamily: 'Raleway',
//               fontWeight: FontWeight.w700,
//               height: 0,
//             ),
//           ),
//           const SizedBox(height: 18),
//               Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                       'Nama Lengkap',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.w500,
//                         height: 0,
//                       ),
//                     ),
//                       SizedBox(height: 4),
//                        Container(
//                       width: double.infinity,
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none),
//                           hintText: "Masukkan nama lengkap anda",
//                           filled: true,
//                           fillColor: Colors.white,
//                         ),
//                         controller: _nameController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Wajib diisi';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               //------------------------ PHONE NUMBER ----------------------------
//            const SizedBox(height: 12),
//            Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                         'No. Hp',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontFamily: 'Raleway',
//                           fontWeight: FontWeight.w500,
//                           height: 0,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                 Container(
//                         width: double.infinity, // Ubah menjadi double.infinity agar lebar dapat menyesuaikan Expanded
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide.none),
//                             hintText: "Masukkan no hp anda",
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           controller: _phoneController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Nomor telepon wajib diisi';
//                             }
//                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//                               return 'Nomor telepon hanya boleh berisi angka';
//                             }

//                             return null;
//                           },
//                         ),
//                       ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           //------------------------ BIRTHDATE ----------------------------
//                 Container(
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Tanggal Lahir',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontFamily: 'Raleway',
//                           fontWeight: FontWeight.w500,
//                           height: 0,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Container(
//                         width: double.infinity,
//                         child: InkWell(
//                           onTap: () {
//                             _selectDate(context);
//                           },
//                           child: IgnorePointer(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 hintText: "Masukkan tanggal lahir anda",
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 suffixIcon: Icon(
//                                   Icons.calendar_today,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               controller: _birthdayController,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Ulang tahun wajib diisi';
//                                 }
//                                 return null;
//                               },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//                       const SizedBox(height: 12),
//           //------------------------ EMAIL ----------------------------
//           Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Email',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontFamily: 'Raleway',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Container(
//                   width: double.infinity,
//                   child: Container(
//                     width: 250,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none),
//                             hintText: "Masukkan email anda",
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       controller: _emailController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Alamat email wajib diisi';
//                         }

//                         // Check if the value is a valid email address
//                         if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//                             .hasMatch(value)) {
//                           return 'Masukkan alamat email yang valid';
//                         }

//                         return null;
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           //------------------------ PASSWORD ----------------------------
//           Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Password',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontFamily: 'Raleway',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Container(
//                   width: double.infinity,
//                   child: Container(
//                     width: 250,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none),
//                         hintText: "Masukkan password anda",
//                         filled: true,
//                         fillColor: Colors.white,
//                         suffixIcon: IconButton(
//                           padding: const EdgeInsets.only(),
//                           icon: Icon(
//                             _obscureText
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                             color: Colors.grey,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureText = !_obscureText;
//                             });
//                           },
//                         ),
//                       ),
//                       controller: _passwordController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Password wajib diisi';
//                         }
//                         if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
//                           return 'Password harus mengandung huruf besar';
//                         }
//                         if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
//                           return 'Password harus mengandung huruf kecil';
//                         }
//                         if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
//                           return 'Password harus mengandung angka';
//                         }
//                         return null;
//                       },
//                       obscureText: _obscureText,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 //--------------------------- CONFIRM PASSWORD --------------------------
//                 Container(
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Konfirmasi Password',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontFamily: 'Raleway',
//                           fontWeight: FontWeight.w500,
//                           height: 0,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Container(
//                         width: double.infinity,
//                         child: Container(
//                           width: 250,
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide.none),
//                               hintText: "Masukkan konfirmasi password anda",
//                               filled: true,
//                               fillColor: Colors.white,
//                               suffixIcon: IconButton(
//                                 padding: const EdgeInsets.only(),
//                                 icon: Icon(
//                                   _obscureText
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: Colors.grey,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscureText = !_obscureText;
//                                   });
//                                 },
//                               ),
//                             ),
//                             controller: _confirmpasswordController,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Konfirmasi password kosong';
//                               }
//                               if (value != _passwordController.text) {
//                                 return 'Password tidak sesuai';
//                               }
//                               return null;
//                             },
//                             obscureText: _obscureText,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//     // ]));
//   }

//   Future<void> registerUser() async {
//     String fullName = _nameController.text;
//     String phoneNumber = _phoneController.text;
//     String email = _emailController.text;
//     String password = _passwordController.text;
//     String confirmPassword = _confirmpasswordController.text;
//     String birthDate = _birthdayController.text;

//     try {
//       Map<String, String> data = {
//         'nama_lengkap': fullName,
//         'no_hp': phoneNumber,
//         'tanggal_lahir': birthDate,
//         'email': email,
//         'kata_sandi': password,
//         'konfirmasi_kata_sandi': confirmPassword,
//       };

//       final response = await http.post(
//         Uri.parse('http://localhost:8000/register'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(data),
//       );

//       // Handle response accordingly
//       print(response.body);

//       // You can add navigation logic here based on the response
//     } catch (e) {
//       // Handle error accordingly
//       print('Error: $e');
//     }
//   }

// Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         _birthdayController.text = picked.toString().split(' ')[0];
//       });
//     }
//   }
// }
