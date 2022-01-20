import 'package:ed_call/helper/helper.dart';
import 'package:ed_call/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';

class PanduanScreen extends StatefulWidget {
  const PanduanScreen({Key? key}) : super(key: key);

  @override
  _PanduanScreenState createState() => _PanduanScreenState();
}

class _PanduanScreenState extends State<PanduanScreen> {
  final PageController _pageController = PageController();
  double? currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Panduan',
                  style: TextStyle(
                      fontSize: Helper.getAdaptiveText(context, 26.0),
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            blurRadius: 6.0,
                            color: Colors.black45,
                            offset: Offset(0.0, 0.0))
                      ]),
                ),
              ],
            ),
            Container(height: 50, child: Image.asset('assets/images/icon.png')),
          ],
        ),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 50.0),
            width: size.width * 0.85,
            height: size.height * 0.55,
            decoration: BoxDecoration(
                color: Colors.greenAccent[700],
                borderRadius: BorderRadius.circular(8.0)),
            child: Stack(children: [
              PageView(
                controller: _pageController,
                children: [
                  _panduan('Lapor',
                      'Pengguna diminta untuk memasukkan data diri, kondisi kesehatan dan gejala-gejala yang dialami'),
                  _panduan('Kontak',
                      'Disini akan ditampilkan kontak instansi kesehatan yang dapat dihubungi')
                ],
              ),
              Positioned.fill(
                bottom: 18.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 2; i++)
                        DotIndicator(isSelected: currentPage == i)
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }

  Widget _panduan(String title, String description) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 26.0),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 22.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.greenAccent[700],
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 18.0,
        ),
        Container(
          margin: EdgeInsets.all(18.0),
          child: Text(
            description,
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 14.0),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
