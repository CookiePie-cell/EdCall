import 'package:ed_call/kontak_screen.dart';
import 'package:ed_call/laporscreen.dart';
import 'package:ed_call/panduan_sceen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
            height: size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.greenAccent[700],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0))),
            child: Column(
              children: [
                SizedBox(height: 50.0),
                Expanded(
                    child: Image.asset(
                  'assets/images/icon.png',
                )),
                SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat datang!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 250.0,
                          height: 6.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
        SizedBox(height: 48.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LaporScreen()));
              },
              child: Text(
                "Lapor",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent[700]),
                  minimumSize: MaterialStateProperty.all(Size(160, 40)),
                  elevation: MaterialStateProperty.all(8.0)),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KontakScreen()));
              },
              child: Text(
                "Kontak",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent[700]),
                  minimumSize: MaterialStateProperty.all(Size(160, 40)),
                  elevation: MaterialStateProperty.all(8.0)),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PanduanScreen()));
              },
              child: Text(
                "Panduan",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent[700]),
                  minimumSize: MaterialStateProperty.all(Size(160, 40)),
                  elevation: MaterialStateProperty.all(8.0)),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        )
      ],
    ));
  }
}
