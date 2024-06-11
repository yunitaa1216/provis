import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> chatOptions = [
    "Apa fitur yang tersedia di aplikasi ini?",
    "Bagaimana cara melakukan booking di aplikasi ini?",
    "Bagaimana cara mengubah atau membatalkan janji yang sudah dibuat?",
    "Apa saja persyaratan yang diperlukan untuk membuat janji dokter?",
    // "Bagaimana cara menggunakan fitur konsultasi online?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        toolbarHeight: 60,
        title: Text('Q & A'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: chatOptions.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chatOptions[index]),
            onTap: () {
              _showBotResponse(chatOptions[index]);
            },
          );
        },
      ),
    );
  }

  void _showBotResponse(String question) {
    String botResponse = "";

    // Logic to respond to different questions
    if (question.contains("fitur")) {
      botResponse =
          "Fitur yang tersedia di aplikasi ini meliputi pemesanan jadwal rawat jalan, pembayaran, informasi obat dan lain sebagainya.";
    } else if (question.contains("booking")) {
      botResponse =
          "Untuk melakukan booking di aplikasi ini, Anda dapat masuk ke halaman Booking, pilih dokter yang anda inginkan lalu pilih tanggal dan waktu jadwal rawwat jalan anda.";
    } else if (question.contains("mengubah") || question.contains("membatalkan")) {
      botResponse =
          "Anda dapat mengubah atau membatalkan janji yang sudah dibuat dengan menghubungi layanan pelanggan kami di nomor 123456789.";
    } else if (question.contains("persyaratan")) {
      botResponse =
          "Persyaratan yang diperlukan adalah buatlah janji di halaman booking lalu anda akan mendapatkan no antrian. Datanglah tepat waktu sesuai waktu janji temu anda.";
    } else {
      botResponse = "Maaf, saya tidak mengerti pertanyaan Anda.";
    }

    // Show bot response in dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bot Pulih'),
          content: Text(botResponse),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Tutup',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
