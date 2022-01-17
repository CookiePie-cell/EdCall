import 'dart:developer';

import 'package:ed_call/main.dart';
import 'package:flutter/material.dart';

class GejalaStep extends StatefulWidget {
  final Map<String, bool> gejala;
  final Function(String, bool?) onChangedCallback;
  late TextEditingController? gejalaController;
  GejalaStep(
      {Key? key,
      required this.gejala,
      this.gejalaController,
      required this.onChangedCallback})
      : super(key: key);

  @override
  _GejalaStepState createState() => _GejalaStepState();
}

class _GejalaStepState extends State<GejalaStep> {
  // Map<String, bool> gejala = {
  //   'Demam/Panas': false,
  //   'Kelelahan': false,
  //   'Batuk': false,
  //   'Flu/Pilek': false,
  //   'Hilang Penciuman': false,
  //   'Hilang rasa': false
  // };

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
          height: 38.0,
        ),
        Container(
          height: 330,
          width: 380,
          child: ListView(
            shrinkWrap: true,
            children: widget.gejala.keys.map((String key) {
              return CheckboxListTile(
                  title: Text(key),
                  value: widget.gejala[key],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.gejala[key] = value!;
                    });
                    widget.onChangedCallback(key, value!);
                  });
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17.0, top: 8.0),
          child: Row(
            children: [
              Text("Lainnya : ", style: TextStyle(fontSize: 16.0)),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Form(
                  key: gejalaFormKey[0],
                  child: TextFormField(
                    controller: widget.gejalaController,
                    decoration: const InputDecoration(
                      hintText: "Deskripsikan gejala",
                    ),
                    validator: (value) {
                      if (!widget.gejala.values
                              .any((element) => element == true) &&
                          (value == null || value.isEmpty)) {
                        return 'Deskripsikan gejala anda jika anda tidak \nmengalami gejala-gejala di atas';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      log("${value} saved");
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
