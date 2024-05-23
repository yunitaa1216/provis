import 'package:flutter/material.dart';
import 'package:prak_provis/view/booking/pemesanan_sukses.dart';
import 'package:prak_provis/view/pembayaran/pembayaran_sukses.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:women_center_mobile/Models/metodepembayaran_model/metodepembayaran1_model.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../model/pembayaran_model/pembayaran_model.dart';
import '../../model/utils/navigation_service.dart';
// import 'package:women_center_mobile/Models/utils/navigation_service.dart';
// import 'package:women_center_mobile/ViewModel/api_pembayaran/pembayaran_api.dart';

// import '../../Models/metodepembayaran_model/counseling_payment_model.dart';
// import '../../ViewModel/konselor_view_model/konselor_view_model.dart';

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

  // late String order_id;
  // late KonselorViewModel konselorViewModel;
  // late CounselingSessionModel counselingSessionModel;

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUserProfile();
  //    konselorViewModel = Provider.of<KonselorViewModel>(context, listen: false);
  //    loadOrderId(); // Memanggil metode untuk memuat order_id dari SharedPreferences
  //    konselorViewModel.fetchCounselingSessionData();
  // }

  // Future<void> loadOrderId() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedOrderId = prefs.getString("order_id");
  //   if (savedOrderId != null) {
  //     setState(() {
  //       order_id = savedOrderId;
  //     });
  //   }
  // }

  // Future<void> _fetchUserProfile() async {
  //   try {
  //     final response = await _apiPembayaran.getUserProfile();
  //     print('Profile Picture URL: ${_userProfile['profile_picture']}');
  //     setState(() {
  //       _userProfile = response['data'];
  //     });
  //   } catch (error) {
  //     print('Error fetching user profile: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        toolbarHeight: 96,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back,
            color: Colors.black,),
            onPressed: () {},
          ),
        ),
        title: Center(
          child: Transform.translate(
            offset: Offset(0.0, 10.0), // Adjust the value to move the text down
            child: Text(
              'Metode Pembayaran',
              style: TextStyle(
                // Use the Google Fonts class
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
                    color: Colors.white, // Set background color to white
                    border: Border.all(
                      color: Color(0xFFBEDCF2), // Set border color to pink
                    ),
                    borderRadius:
                        BorderRadius.circular(8), // Set border radius if needed
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
                          Text('50'),
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
                            'Yunita Anggeraini',
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
                            'dr. Stenafie Russel',
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
                            'Senin. 2 Oktober 2023, Jam 09.00',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'E-Wallet',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                                  // style: TextStyle(
                                  //   fontWeight: FontWeight.bold,
                                  // ),
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
                      Divider(), // Add a divider after each payment method row
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Transfer Virtual Account',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                                  // style: TextStyle(
                                  //   fontWeight: FontWeight.bold,
                                  // ),
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
                      Divider(), // Add a divider after each payment method row
                    ],
                  );
                },
              ),
              // SizedBox(height: 20),
              // _buildTotalPayment(),
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
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp200.000',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBEDCF2)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => MetodePembayaran1(),
                  //           ));
                  //     },
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PemebayaranSukses()
                  )
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFBEDCF2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize:
                      Size(86, 40), // Set the width and height of the button
                ),
                child: Text(
                  'Bayar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
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
