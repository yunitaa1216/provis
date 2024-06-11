import 'package:flutter/material.dart';
import 'package:prak_provis/model/utils/auth_service.dart';
import 'package:prak_provis/view/booking/pemesanan_sukses.dart';
import 'package:prak_provis/view/pembayaran/pembayaran_sukses.dart';
import 'package:intl/intl.dart';
import '../../model/pembayaran_model/pembayaran_model.dart';
import '../../model/utils/navigation_service.dart';

class MetodePembayaran1 extends StatefulWidget {
  const MetodePembayaran1({super.key});

  @override
  State<MetodePembayaran1> createState() => _MetodePembayaran1State();
}

class _MetodePembayaran1State extends State<MetodePembayaran1> {
  Map<String, dynamic> _userProfile = {};
  int? selectedPaymentIndex;
  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      image: 'Assets/images/dana.png',
      name: 'Dana',
    ),
    PaymentMethod(
      image: 'Assets/images/gopay.png',
      name: 'Gopay',
    ),
    PaymentMethod(
      image: 'Assets/images/link.png',
      name: 'LinkAja',
    ),
    PaymentMethod(
      image: 'Assets/images/ovo.png',
      name: 'Ovo',
    ),
    PaymentMethod(
      image: 'Assets/images/qris.png',
      name: 'Qris',
    ),
    PaymentMethod(
      image: 'Assets/images/BSI.png',
      name: 'Bank Syariah Indonesia',
    ),
    PaymentMethod(
      image: 'Assets/images/mandiri.png',
      name: 'Bank Mandiri',
    ),
    PaymentMethod(
      image: 'Assets/images/BCA.png',
      name: 'Bank Central Asia',
    ),
    PaymentMethod(
      image: 'Assets/images/BRI.png',
      name: 'Bank Republik Indonesia',
    ),
    PaymentMethod(
      image: 'Assets/images/BNI.png',
      name: 'Bank Nasional Indonesia',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> bookingData = AuthService.getBookingData();
    String doctorName = AuthService.getDoctorNameById(bookingData['doctorId']);
    String appointmentDate = bookingData['date'];
    String appointmentTime = bookingData['time'];

    DateTime dateTime = DateTime.parse(appointmentDate);
    String dayOfWeek = DateFormat('EEEE', 'id_ID').format(dateTime);
    String formattedDate = DateFormat('d MMMM yyyy', 'id_ID').format(dateTime);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        toolbarHeight: 96,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
          ),
        ),
        title: Center(
          child: Transform.translate(
            offset: Offset(0.0, 10.0), // Adjust the value to move the text down
            child: Text(
              'Metode Pembayaran',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Color(0xFFF9F5F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Order',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFFBEDCF2),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'No Antrian',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('15'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Nama Pasien',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '${AuthService.email}',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Dokter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            doctorName,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Jadwal Rawat Jalan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '$dayOfWeek, $formattedDate, Jam $appointmentTime',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'E-Wallet',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final paymentMethod = paymentMethods[index];

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedPaymentIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              paymentMethod.image,
                              width: 40,
                              height: 32,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  paymentMethod.name,
                                ),
                              ),
                            ),
                            Radio(
                              value: index,
                              groupValue: selectedPaymentIndex,
                              onChanged: (value) {
                                setState(() {
                                  selectedPaymentIndex = value as int?;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Transfer Virtual Account',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final paymentMethod = paymentMethods[index + 5];

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedPaymentIndex = index + 5;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              paymentMethod.image,
                              width: 70,
                              height: 50,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  paymentMethod.name,
                                ),
                              ),
                            ),
                            Radio(
                              value: index + 5,
                              groupValue: selectedPaymentIndex,
                              onChanged: (value) {
                                setState(() {
                                  selectedPaymentIndex = value as int?;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              _buildCardTotalPayment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardTotalPayment() {
    return Container(
      height: 80,
      width: 350,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp200.000',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, bottom: 16),
              child: ElevatedButton(
                onPressed: selectedPaymentIndex != null ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PemebayaranSukses(),
                    ),
                  );
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedPaymentIndex != null ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(86, 40),
                ),
                child: Text(
                  'Bayar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.
                    white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}