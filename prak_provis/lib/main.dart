import 'package:flutter/material.dart';
import 'package:prak_provis/view/artikel/artikel_view.dart';
import 'package:prak_provis/view/artikel/artikelku1.dart';
import 'package:prak_provis/view/booking/jadwalbooking.dart';
import 'package:prak_provis/view/booking/pesanjadwal.dart';
import 'package:prak_provis/view/dokter/dokter_view.dart';
import 'package:prak_provis/view/dokter/dokter_widget.dart';
import 'package:prak_provis/view/homepage/homepage_1.dart';
import 'package:prak_provis/view/homepage/homepage_3.dart';
import 'package:prak_provis/view/homepage/homepageutama.dart';
import 'package:prak_provis/view/kalender/kalender.dart';
import 'package:prak_provis/view/login/login_view.dart';
import 'package:prak_provis/view/notifikasi/homepage_notifikasi_3.dart';
import 'package:prak_provis/view/pembayaran/pembayaran.dart';
import 'package:prak_provis/view/booking/pemesanan_sukses.dart';
import 'package:prak_provis/view/pembayaran/pembayaran_sukses.dart';
import 'package:prak_provis/view/profile/chatbot.dart';
import 'package:prak_provis/view/profile/informasi.dart';
import 'package:prak_provis/view/profile/profil.dart';
import 'package:prak_provis/view/profile/tentang_kami.dart';
import 'package:prak_provis/view/register/register.dart';
import 'package:prak_provis/view/welcome_screen/welcome_screen.dart';
import 'package:prak_provis/viewmodel/api_listdokter/list_dokter.dart';
import 'package:prak_provis/viewmodel/api_login/login_api.dart';
import 'package:prak_provis/viewmodel/api_profil/api_profil.dart';
import 'package:prak_provis/viewmodel/api_profil/profil_viewmodel.dart';
import 'package:prak_provis/viewmodel/api_register/register_api.dart';
import 'package:provider/provider.dart';
import 'package:prak_provis/model/dokter_model/dokter_model.dart';
import 'model/artikel_model/artikel_model.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() {
  initializeDateFormatting('id_ID', null).then((_) {
    // Lakukan hal lain setelah inisialisasi berhasil
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        // ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        // ChangeNotifierProvider(create: (context) => ProfilViewModel()),
        // ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
    child:
     MaterialApp(
      debugShowCheckedModeBanner: false,
      // automaticallyImplyLeading: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => LoginView(), 
        '/register':(context) => Register(),
        '/homepage':(context) => HomepageSection(pindahHalaman: (index) {
      // Lakukan sesuatu dengan index
    }),
    '/kalender':(context) => KalenderEvent(),
    '/pembayaran':(context) => MetodePembayaran1(),
    '/profil':(context) =>  ProfilPage(),
    '/info': (context) => Information(),
        '/tentang': (context) => Aboutme(),
        '/chat': (context) => ChatScreen(),
        '/artikel': (context) => Artikel(),
        '/artikel1': (context) => ArtikelDetailPage(
          artikel: ArtikelKuModel(
            "assets/images/artikelku1.jpg",
            "Dokter Dian Safitri",
            "Cara Menjaga Kesethatan Tubuh Agar Terhindar dari Penyakit",
          ),
        
        ),
        '/pilihandokter':(context) => KonselingSection(idPaket: 1),
        '/pemesanansukses':(context) => PemesananSukses(),
        '/pemebayaransukses':(context) => PemebayaranSukses(),
        // '/bookingdokter' :(context) => BookingDokter(description: "description", schedule:[1], konselorId: 1, paketId: 1)
        // '/booking':(context) => Booking()
        '/booking':(context) => BookingForm(),
        '/notifikasi': (context) => HomepageNotifikasi3()
      },
    ),   
    );
  }
}
