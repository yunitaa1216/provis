// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class UcapanSelamat extends StatefulWidget {
//   @override
//   _UcapanSelamatState createState() => _UcapanSelamatState();
// }

// class _UcapanSelamatState extends State<UcapanSelamat> {
//   String ucapan = "";

//   @override
//   void initState() {
//     super.initState();
//     _updateUcapan();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       ucapan,
//       style: TextStyle(
//         fontSize: 24.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//     );
//   }

//   void _updateUcapan() {
//     final now = DateTime.now();
//     final hour = now.hour;

//     if (hour >= 0 && hour < 12) {
//       setState(() {
//         ucapan = "Selamat Pagi";
//       });
//     } else if (hour >= 12 && hour < 15) {
//       setState(() {
//         ucapan = "Selamat Siang";
//       });
//     } else if (hour >= 15 && hour < 18) {
//       setState(() {
//         ucapan = "Selamat Sore";
//       });
//     } else {
//       setState(() {
//         ucapan = "Selamat Malam";
//       });
//     }
//   }
// }

// class HomepageSectionUtama extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           UcapanSelamat(),
//           LatestArtikel(
//             artikel: ArtikelModel(
//               thumbnail: 'thumbnail_url',
//               author: Author(name: 'Author Name'),
//               title: 'Article Title',
//             ),
//           ),
//           RekomendasiKonselor(),
//         ],
//       ),
//     );
//   }
// }

// class LatestArtikel extends StatelessWidget {
//   final ArtikelModel artikel;

//   const LatestArtikel({Key? key, required this.artikel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Artikel Untukmu',
//               style: TextStyle(
//                 fontFamily: 'Raleway',
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 // pindahHalaman(1);
//               },
//               child: const Text(
//                 'Selengkapnya',
//                 style: TextStyle(
//                   fontFamily: 'Raleway',
//                   color: Color(0xFF646464),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         fromManualData(),
//       ],
//     );
//   }

//   Widget fromManualData() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20.0),
//             child: Image.network(
//               artikel.thumbnail,
//               width: double.infinity, // Atur lebar gambar
//               height: 200.0, // Atur tinggi gambar
//               fit: BoxFit.fill,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 artikel.author.name,
//                 style: TextStyle(
//                   color: Color(0xFF787878),
//                   fontFamily: 'Poppins',
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Expanded(
//                 child: SizedBox(),
//               ),
//               Text(
//                 artikel.formatJam(),
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.normal,
//                   color: Color(0xFFA5A5A5),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Text(
//                   artikel.title,
//                   softWrap: true,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Poppins',
//                     fontSize: 25,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ArtikelModel {
//   final String thumbnail;
//   final Author author;
//   final String title;

//   ArtikelModel({required this.thumbnail, required this.author, required this.title});

//   String formatJam() {
//     // Implementasi untuk format waktu artikel
//     return "12:00"; // Contoh waktu
//   }
// }

// class Author {
//   final String name;

//   Author({required this.name});
// }

// class RekomendasiKonselor extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Card(
//           margin: EdgeInsets.all(20),
//           color: Color(0xFFF8E8EE),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Rekomendasi Konselor',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 Column(
//                   children: [
//                     Center(
//                       child: CircleAvatar(
//                         backgroundImage: AssetImage(
//                             'assets/images/welcome.jpg'), // Ganti dengan path foto profil konselor
//                         radius: 40,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text('Stanefie Russel, M.Psi., Psikolog',
//                         style: TextStyle(
//                           fontSize: 16,
//                         )),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text('Profesional Konselor',
//                         style: TextStyle(fontSize: 12, color: Color(0xFF646464))),
//                   ],
//                 ),
//                 SizedBox(height: 45),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(width: 136), // Jarak antara bintang dan tek
//                         Container(
//                           height: 38, // Sesuaikan dengan tinggi garis yang diinginkan
//                           width: 1, // Lebar garis
//                           color: Colors.grey, // Warna garis
//                           margin: EdgeInsets.symmetric(horizontal: 29), // Margin antara garis dan teks
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Senin',
//                                     style: TextStyle(fontSize: 15, color: Color(0xFF1F1F1F))),
//                                 Text('09.00-15.00 WIB',
//                                     style: TextStyle(fontSize: 12, color: Color(0xFF1F1F1F)))
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 25, // Sesuaikan dengan tinggi garis yang diinginkan
//                       width: 1, // Lebar garis
//                       color: Colors.grey, // Warna garis
//                       margin: EdgeInsets.symmetric(horizontal: 45), // Margin antara garis dan teks
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Universitas',
//                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                             Text('Indonesia',
//                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                             Text('S2 - Psikologi',
//                                 style: TextStyle(fontSize: 13, color: Color(0xFF646464))),
//                           ],
//                         ),
//                         Container(
//                           height: 62, // Sesuaikan dengan tinggi garis yang diinginkan
//                           width: 1, // Lebar garis
//                           color: Colors.grey, // Warna garis
//                           margin: EdgeInsets.only(left: 86, right: 31), // Margin antara garis dan teks
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Rabu',
//                                     style: TextStyle(fontSize: 15, color: Color(0xFF1F1F1F))),
//                                 Text('09.00-15.00 WIB',
//                                     style: TextStyle(fontSize: 12, color: Color(0xFF1F1F1F)))
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 25, // Sesuaikan dengan tinggi garis yang diinginkan
//                       width: 1, // Lebar garis
//                       color: Colors.grey, // Warna garis
//                       margin: EdgeInsets.symmetric(horizontal: 45), // Margin antara garis dan teks
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text('@stefaniersl', style: TextStyle(fontSize: 15)),
//                         Container(
//                           height: 53, // Sesuaikan dengan tinggi garis yang diinginkan
//                           width: 1, // Lebar garis
//                           color: Colors.grey, // Warna garis
//                           margin: EdgeInsets.only(left: 81, right: 31), // Margin antara garis dan teks
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Jumat',
//                                     style: TextStyle(fontSize: 15, color: Color(0xFF1F1F1F))),
//                                 Text('09.00-21.00 WIB',
//                                     style: TextStyle(fontSize: 12, color: Color(0xFF1F1F1F)))
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 15),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 150,
//                       height: 40,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Handle button tap action here
//                         },
//                         child: Text('Pilih Paket',
//                             style: TextStyle(color: Colors.white, fontSize: 14)),
//                         style: ButtonStyle(
//                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                               Color.fromRGBO(244, 81, 141, 1)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }