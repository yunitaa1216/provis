import 'package:flutter/material.dart';
import 'package:prak_provis/model/utils/auth_service.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String doctorName = AuthService.getDoctorNameById(1);
    String spesialisname = AuthService.getDoctorSpecializationById(1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Artikel Untukmu',
              textAlign: TextAlign.left,
            ),
            Spacer(), // Spacer ini akan menempatkan jarak di antara teks dan tombol
            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/artikel');
            }, child: Text('Lihat Selengkapnya', style: TextStyle(color: Colors.blue),),
            )
          ],
        ),
        SizedBox(height: 8.0,), // Memberikan jarak antara teks dan gambar
        ArtikelImage(width: 400),
        SizedBox(height: 8.0,), // Memberikan jarak antara gambar dan teks di bawahnya
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Oleh',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: 4.0), // Memberikan sedikit jarak antara teks "Oleh" dan "Dian"
            Text(
              'Dian',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 4.0), // Memberikan jarak antara teks "Dian" dan judul berikutnya
        Text(
          'Cara Menjaga Kesehatan Tubuh Agar Terhindar dari Penyakit',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 20), // Jarak antara card pertama dan card kedua
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.all(20),
                color: Color(0xFFD8F0FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rekomendasi Dokter',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(doctorName,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(spesialisname,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF646464))),
                        ],
                      ),
                      SizedBox(height: 45),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 200), // Jarak antara bintang dan tek
                              // Container(
                              //   height:
                              //       38, // Sesuaikan dengan tinggi garis yang diinginkan
                              //   width: 1, // Lebar garis
                              //   color: Colors.grey, // Warna garis
                              //   margin: EdgeInsets.symmetric(
                              //       horizontal:
                              //           29), // Margin antara garis dan teks
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Senin',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF1F1F1F))),
                                      Text('09.00-15.00 WIB',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF1F1F1F)))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Universitas',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text('Indonesia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ],
                              ),
                              // Container(
                              //   height:
                              //       62, // Sesuaikan dengan tinggi garis yang diinginkan
                              //   width: 1, // Lebar garis
                              //   color: Colors.grey, // Warna garis
                              //   margin: EdgeInsets.only(
                              //       left: 87,
                              //       right: 31), // Margin antara garis dan teks
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                  width: 120),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Rabu',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF1F1F1F))),
                                      Text('09.00-15.00 WIB',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF1F1F1F)))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 200),
                              // Container(
                              //   height:
                              //       53, // Sesuaikan dengan tinggi garis yang diinginkan
                              //   width: 1, // Lebar garis
                              //   color: Colors.grey, // Warna garis
                              //   margin: EdgeInsets.only(
                              //       left: 165,
                              //       right: 31), // Margin antara garis dan teks
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jumat',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF1F1F1F))),
                                      Text('09.00-21.00 WIB',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF1F1F1F)))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/pilihandokter');
                              },
                              child: Text('Booking Sekarang',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF3C96E9)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ],
    );
  }
}

class ArtikelImage extends StatelessWidget {
  final double width;

  const ArtikelImage({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 200, // Anda bisa tetapkan tinggi yang tetap atau biarkan fleksibel seperti ini
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage('assets/images/login_register.png'), // Ganti dengan path gambar sesuai dengan lokasi Anda
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
