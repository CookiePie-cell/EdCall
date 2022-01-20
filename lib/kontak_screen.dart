import 'package:ed_call/helper/helper.dart';
import 'package:ed_call/homescreen.dart';
import 'package:flutter/material.dart';

class KontakScreen extends StatelessWidget {
  const KontakScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: size.height * 0.15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18.0),
                bottomRight: Radius.circular(18.0))),
        // shape: ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kontak',
                  style: TextStyle(
                      fontSize: Helper.getAdaptiveText(context, 28.0),
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            blurRadius: 6.0,
                            color: Colors.black45,
                            offset: Offset(0.0, 0.0))
                      ]),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.005,
                  color: Colors.white,
                )
              ],
            ),
            Container(
                width: size.width * 0.45,
                child: Image.asset('assets/images/icon.png')),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 34.0,
          ),
          Container(
            width: size.width * 0.65,
            decoration: BoxDecoration(
                color: Colors.greenAccent[700],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nama instansi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Helper.getAdaptiveText(context, 16.0),
                ),
              ),
            ),
          ),
          _myText(context, 'UPTD Puskesmas Doloduo Kec. Dumoga Barat'),
          _border(),
          SizedBox(
            height: 34.0,
          ),

          Container(
            width: size.width * 0.65,
            decoration: BoxDecoration(
                color: Colors.greenAccent[700],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nomor Telpon Instansi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Helper.getAdaptiveText(context, 16.0),
                ),
              ),
            ),
          ),
          // SizedBox(height: 18.0,),
          _myText(context, '08111911123'),
          _border(),
          SizedBox(
            height: 34.0,
          ),
          Container(
            width: size.width * 0.65,
            decoration: BoxDecoration(
                color: Colors.greenAccent[700],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Catatan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Helper.getAdaptiveText(context, 16.0),
                ),
              ),
            ),
          ),
          _myText(context,
              'Terima kasih telah menggunakan layanan Ed Call. Data Anda akan dikirim ke Instansi kesehatan yang tertera di atas. Silahkan hubungi nomor instansi di atas jika ada keluhan lebih lanjut'),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 45.0, bottom: 45.0, right: 38.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent[700]),
                      minimumSize: MaterialStateProperty.all(Size(100, 40)),
                      elevation: MaterialStateProperty.all(8.0)),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  child: Text('Menu', style: TextStyle(color: Colors.white))),
            ),
          )
        ],
      ),
    );
  }

  Widget _myText(BuildContext context, String text) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 18, bottom: 12, left: 18, right: 18),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 16.0),
              color: Colors.black45),
        ));
  }

  Widget _border() {
    return Container(
        margin: EdgeInsets.only(left: 14.0),
        height: 1.0,
        width: 245.0,
        color: Colors.black54);
  }
}
