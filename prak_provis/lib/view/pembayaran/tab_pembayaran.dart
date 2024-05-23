// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   int _currentTabIndex = 0;
//   TabController? _tabController; // Declare as nullable

//   @override
//   void initState() {
//     super.initState();
//     _tabController =
//         TabController(vsync: this, length: 2, initialIndex: _currentTabIndex);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController?.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         PaymentCard(),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 23, right: 23),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Pilih Pembayaran',
//                     style: TextStyle(
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'M-Banking'),
//             Tab(text: 'ATM'),
//           ],
//           onTap: (index) {
//             setState(() {
//               _currentTabIndex = index;
//             });
//           },
//           labelPadding: EdgeInsets.only(left: 20),
//           labelStyle: TextStyle(fontSize: 16),
//           unselectedLabelStyle: TextStyle(fontSize: 14),
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: _tabController,
//             children: [
//               _mBanking(),
//               _atm(),
//             ],
//           ),
//         ),
//         SizedBox(height: 20),
//         //--------------------BUTTOM SELESAI -----------------
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8, left: 23, right: 23),
//           child: Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/pembayaranSukses');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFBEDCF2),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(35),
//                     ),
//                   ),
//                   child: Text(
//                     'Selesai',
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _mBanking() {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'LANGKAH 1 : MASUK KE AKUN ANDA',
//               style: TextStyle(
//                   fontFamily: 'Raleway',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(height: 6),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '  1. Buka aplikasi Livin by Mandiri atau M-Banking',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  2. Pilih menu "Pembayaran" ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  3. Pilih "Pembayaran Baru" ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  4. Pilih "Multi Payment" ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  5. Klik "Penyedia Jasa" atau "Service Provider" ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//               ],
//             ),
//             SizedBox(height: 6),
//             Text(
//               'LANGKAH 2 : DETAIL PEMBAYARAN',
//               style: TextStyle(
//                   fontFamily: 'Raleway',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(height: 6),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '  6. Pilih kode perusahaan',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  7. Pilih "Nomor Virtual" ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  8. Masukkan Nomor Virtual Account 017412481241 ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  9. Konfirmasi detail VA dan klik "Lanjut"',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  10. Masukkan nominal yang ingin dibayarkan',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '      (jika tidak terisi secara otomatis)',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//               ],
//             ),
//             SizedBox(height: 6),
//             Text(
//               'LANGKAH 3 : TRANSAKSI BERHASIL',
//               style: TextStyle(
//                   fontFamily: 'Raleway',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(height: 6),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '  11. Setelah transaksi pembayaran anda selesai,',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '        simpan bukti pembayaran',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  12. Invoice ini akan diperbarui secara otomatis ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//               ],
//             ),
//             SizedBox(height: 6),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _atm() {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'LANGKAH 1 : MASUK KE AKUN ANDA',
//               style: TextStyle(
//                   fontFamily: 'Raleway',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(height: 6),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '  1. Masukkan kartu ATM Mandiri',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  2. Pilih menu Bayar/Beli ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  3. Pilih "Multi Payment" ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//               ],
//             ),
//             SizedBox(height: 6),
//             Text(
//               'LANGKAH 2 : DETAIL PEMBAYARAN',
//               style: TextStyle(
//                   fontFamily: 'Raleway',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(height: 6),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '  4. Masukkan Nomor Virtual Account 017412481241',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  5. Konfirmasi detail VA dan klik "Continue" ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  6. Masukkan nominal yang ingin dibayarkan ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '      (jika tidak terisi secara otomatis)',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '  7. Konfirmasi tagihan Anda. Jika sudah sesuai ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '      tekan "Ya"',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//               ],
//             ),
//             SizedBox(height: 6),
//             Text(
//               'LANGKAH 3 : TRANSAKSI BERHASIL',
//               style: TextStyle(
//                   fontFamily: 'Raleway',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(height: 6),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '  8. Setelah melakukan transaksi pembayaran Anda  ',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//                 Text(
//                   '     selesai,(simpan struk sebagai bukti pembayaran)',
//                   style: TextStyle(fontFamily: 'Raleway', fontSize: 15),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
