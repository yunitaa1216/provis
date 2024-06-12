// import 'package:flutter/material.dart';
// import 'package:prak_provis/viewmodel/api_profil/api_profil.dart';

// class TokenDisplayWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, dynamic>>(
//       future: ApiProfil().getUserProfile(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(); // Tampilkan indikator loading jika masih menunggu data
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           final email = snapshot.data?['email'] ?? 'Email tidak ditemukan';
//           return Container(
//             child: Text(
//               'Email: $email',
//               style: TextStyle(fontSize: 16.0),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
