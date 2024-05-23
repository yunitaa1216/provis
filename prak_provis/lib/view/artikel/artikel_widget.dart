import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:prak_provis/model/artikel_model/artikel_model.dart';
import 'package:prak_provis/view/artikel/artikelku1.dart';

class ArtikelWidget extends StatefulWidget {
  final List<ArtikelKuModel> artikelList;

  const ArtikelWidget({Key? key, required this.artikelList}) : super(key: key);

  @override
  State<ArtikelWidget> createState() => _ArtikelWidgetState();
}

class _ArtikelWidgetState extends State<ArtikelWidget> {
  Color _warna1 = Colors.white;
  Color _textColor1 = Colors.black;
  Color _warna2 = Colors.white;
  Color _textColor2 = Colors.black;
  Color _warna3 = Colors.white;
  Color _textColor3 = Colors.black;
  Color _warna4 = Colors.white;
  Color _textColor4 = Colors.black;
  Color _warna5 = Colors.white;
  Color _textColor5 = Colors.black;
  Color _warna6 = Colors.white;
  Color _textColor6 = Colors.black;

  String _searchKeyword = '';
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          //-------------- SEARCH BUTTON -----------------
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _searchKeyword = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  labelText: "Cari artikel",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF979797),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pilihan topik",
                ),
              ),
              //-----------Button Topic---------------------
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _warna1 = (_warna1 == Colors.white)
                                  ? Color.fromARGB(255, 52, 155, 234)
                                  : Colors.white;
                              _textColor1 = (_textColor1 == Colors.black)
                                  ? Colors.white
                                  : Colors.black;
                            });
                          },
                          child: Text('Kesehatan Mental',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3C96E9)),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _warna2 = (_warna2 == Colors.white)
                                  ? Color.fromARGB(255, 52, 155, 234)
                                  : Colors.white;
                              _textColor2 = (_textColor2 == Colors.black)
                                  ? Colors.white
                                  : Colors.black;
                            });
                          },
                          child: Text('Jantung',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3C96E9)),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _warna3 = (_warna3 == Colors.white)
                                  ? Color.fromARGB(255, 52, 155, 234)
                                  : Colors.white;
                              _textColor3 = (_textColor3 == Colors.black)
                                  ? Colors.white
                                  : Colors.black;
                            });
                          },
                          child: Text('Karier',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3C96E9)),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _warna4 = (_warna4 == Colors.white)
                                  ? Color.fromARGB(255, 52, 155, 234)
                                  : Colors.white;
                              _textColor4 = (_textColor4 == Colors.black)
                                  ? Colors.white
                                  : Colors.blue;
                            });
                          },
                          child: Text('Seni & Kreatifitas',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3C96E9)),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _warna5 = (_warna5 == Colors.white)
                                  ? Color.fromARGB(255, 52, 155, 234)
                                  : Colors.white;
                              _textColor5 = (_textColor5 == Colors.black)
                                  ? Colors.white
                                  : Colors.black;
                            });
                          },
                          child: Text('Gaya Hidup',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3C96E9)),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _warna6 = (_warna6 == Colors.white)
                                  ? Color.fromARGB(255, 52, 155, 234)
                                  : Colors.white;
                              _textColor6 = (_textColor6 == Colors.black)
                                  ? Colors.white
                                  : Colors.black;
                            });
                          },
                          child: Text('Mental Health',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3C96E9)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              //-----------------------ARTIKEL LIST-----------------------------
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.artikelList.length,
                        itemBuilder: (context, index) {
                          ArtikelKuModel artikel = widget.artikelList[index];
                          if (artikel.judul
                                  .toLowerCase()
                                  .contains(_searchKeyword) ||
                              artikel.dokter
                                  .toLowerCase()
                                  .contains(_searchKeyword)) {
                            return buildArtikelCard(artikel);
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildArtikelCard(ArtikelKuModel artikel) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArtikelDetailPage(artikel: artikel),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            artikel.gambar,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'oleh ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      artikel.dokter,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  artikel.judul,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}