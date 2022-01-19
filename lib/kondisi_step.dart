import 'dart:developer';

import 'package:ed_call/main.dart';
import 'package:flutter/material.dart';

class KondisiStep extends StatefulWidget {
  late TextEditingController? kondisiController, perjalananController;
  final Function(String) onChangeCallback;
  final String dropdownValue;
  KondisiStep(
      {Key? key,
      this.kondisiController,
      this.perjalananController,
      required this.onChangeCallback,
      required this.dropdownValue})
      : super(key: key);

  @override
  _KondisiStepState createState() => _KondisiStepState();
}

class _KondisiStepState extends State<KondisiStep> {
  String _dropdownValue = '1x';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          // height: 23.0,
          decoration: BoxDecoration(
              color: Colors.greenAccent[700],
              borderRadius: BorderRadius.circular(4.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Kondisi Kesehatan',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18.0,
        ),
        Form(
          key: kondisiFormKeys[0],
          child: TextFormField(
            maxLines: 4,
            controller: widget.kondisiController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Cth: Kurang enak badan, pusing...",
            ),
            validator: (value) => value == null || value.isEmpty
                ? 'Masukkan kondisi kesehatan anda'
                : null,
            onSaved: (String? value) {
              log("$value saved");
            },
          ),
        ),
        SizedBox(
          height: 58.0,
        ),
        Container(
          width: double.infinity,
          // height: 23.0,
          decoration: BoxDecoration(
              color: Colors.greenAccent[700],
              borderRadius: BorderRadius.circular(4.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Riwayat Perjalanan',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18.0,
        ),
        Form(
          key: kondisiFormKeys[1],
          child: TextFormField(
            controller: widget.perjalananController,
            decoration: const InputDecoration(
              hintText: "Cth: Luar Kota, Ke Mall...",
            ),
            validator: (value) => value == null || value.isEmpty
                ? 'Masukkan riwayat perjalanan anda jika ada. Isi dengan \n"tidak ada" jika tidak pernah melakukan perjalanan'
                : null,
            onSaved: (String? value) {
              log("$value saved");
            },
          ),
        ),
        SizedBox(height: 48.0),
        Row(
          children: [
            Text("Status Vaksinasi : ",
                style: TextStyle(
                  fontSize: 16.0,
                )),
            DropdownButton<String>(
              value: widget.dropdownValue,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              underline: Container(
                height: 2,
                color: Colors.greenAccent[700],
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownValue = newValue!;
                });
                widget.onChangeCallback(newValue!);
              },
              items: <String>['Belum pernah', '1x', '2x']
                  .map<DropdownMenuItem<String>>((String value) =>
                      DropdownMenuItem<String>(
                          value: value, child: Text(value)))
                  .toList(),
            )
          ],
        ),
        SizedBox(
          height: 32.0,
        )
      ],
    );
  }
}
