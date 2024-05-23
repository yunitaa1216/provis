import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prak_provis/view/profile/chatbot.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:prak_provis/view/profile/informasi.dart';
import 'package:prak_provis/view/profile/tentang_kami.dart';
import 'package:prak_provis/view/widgets/bottom_navigation_bar.dart';
import 'package:prak_provis/view/widgets/navigation_service.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ProfilPage extends StatefulWidget {
  static PreferredSizeWidget get getAppBar {
    return AppBar(
      backgroundColor: Color(0xFFBEDCF2),
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 3.0),
            child: Text(
              'Profil',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool isNotificationEnabled = true;
  Color iconColor = Colors.grey;

  Map<String, dynamic> _userProfile = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 60.0),
              child: Text(
                'Profil',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ]
            ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_outlined),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFBEDCF2),
                      Color.fromRGBO(190, 220, 242, 0.7),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          _userProfile['profile_picture']?.toString() ??
                              'assets/images/Ellipse.png',
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _userProfile['full_name'] ?? 'Reski Dwi',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Card(
                  margin: EdgeInsets.only(
                      top: 1.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(context, Icons.info_outline, 'Informasi',
                            '/informasi', null),
                        buildOption(context, CupertinoIcons.bell, 'Notifikasi',
                            '/notifikasi', null),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(
                      top: 1.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding: EdgeInsets.only(
                        top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(context, Icons.feedback_outlined,
                            'Tentang Kami', '/about', null),
                        buildOption(context, Icons.live_help_outlined,
                            'Bantuan', '/chat', null),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(
                      top: 2.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding: EdgeInsets.only(
                        top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(
                            context, Icons.logout_outlined, 'Keluar', null, () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: 4,
        onItemTapped: (index) {
          if (index == 0) {
      Navigator.pushNamed(context, '/homepage');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/artikel');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/info');
    } else if (index == 4) {
      Navigator.pushNamed(context, '/profil');
    }
        },
      ),
    );
  }

  Widget buildOption(BuildContext context, IconData icon, String label,
      String? route, Function()? onPressed) {
    return InkWell(
      onTap: () {
        if (route == '/informasi') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Information(),
            ),
          );
        } else if (route == '/about') { // Ubah route menjadi '/about' untuk 'Tentang Kami'
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Aboutme(), // Navigasi ke halaman TentangKami
            ),
          );
        } else if (route == '/chat') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(), // Navigasi ke halaman TentangKami
            ),
          );
        } else if (onPressed != null) {
          onPressed();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 16.0),
            Text(label),
            if (route == '/notifikasi') ...[
              Spacer(),
              Switch(
                value: isNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    isNotificationEnabled = value;
                  });
                },
                activeTrackColor: Color(0xFF3C96E9),
                activeColor: Colors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}