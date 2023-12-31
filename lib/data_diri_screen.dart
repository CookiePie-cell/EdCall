import 'dart:developer';

import 'package:ed_call/bloc/location_bloc.dart';
import 'package:ed_call/bloc/location_state.dart';
import 'package:ed_call/helper/helper.dart';
import 'package:ed_call/main.dart';
import 'package:ed_call/widgets/labeled_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Gender { laki_laki, perempuan }

class DataDiriScreen extends StatefulWidget {
  late TextEditingController? nameController,
      telpController,
      alamatController,
      instansiController;
  final Function(String) alamatControllerCallback;
  final Function(Gender) genderValueCallback;
  DataDiriScreen(
      {Key? key,
      required this.alamatControllerCallback,
      required this.genderValueCallback,
      required this.nameController,
      required this.telpController,
      this.alamatController,
      this.instansiController})
      : super(key: key);

  @override
  _DataDiriScreenState createState() => _DataDiriScreenState();
}

class _DataDiriScreenState extends State<DataDiriScreen> {
  // TextEditingController nameController = TextEditingController();
  Gender? _gender = Gender.laki_laki;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            // height: 23.0,
            decoration: BoxDecoration(
                color: Colors.greenAccent[700],
                borderRadius: BorderRadius.circular(4.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Isi Data',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Helper.getAdaptiveText(context, 16.0)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18.0,
        ),
        Form(
          key: formKeys[0],
          child: TextFormField(
            style: TextStyle(fontSize: Helper.getAdaptiveText(context, 14)),
            controller: widget.nameController,
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Nama",
                hintStyle:
                    TextStyle(fontSize: Helper.getAdaptiveText(context, 14.0))),
            validator: (value) =>
                value == null || value.isEmpty ? 'Masukkan nama' : null,
            onSaved: (String? value) {
              log("$value saved");
            },
          ),
        ),
        SizedBox(
          height: 18.0,
        ),
        Form(
          key: formKeys[1],
          child: TextFormField(
            style: TextStyle(fontSize: Helper.getAdaptiveText(context, 14)),
            controller: widget.telpController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "No. Telepon",
                hintStyle:
                    TextStyle(fontSize: Helper.getAdaptiveText(context, 14.0))),
            validator: (value) => value == null || value.isEmpty
                ? 'Masukkan nomor telepon'
                : null,
            onSaved: (String? value) {
              log("$value saved");
            },
          ),
        ),
        SizedBox(
          height: 18.0,
        ),
        BlocConsumer<LocationBloc, LocationState>(
          listener: (context, state) {
            if (state is LocationLoading) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('Memuat alamat')));
            } else if (state is LocationNotLoaded) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('Gagal memuat alamat')));
            } else if (state is LocationLoaded) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('Alamat dimuat')));
            }
          },
          builder: (context, state) {
            if (state is LocationLoaded) {
              widget.alamatController =
                  TextEditingController(text: state.address);
              widget.alamatControllerCallback(state.address);
            }
            return Form(
              key: formKeys[2],
              child: TextFormField(
                style: TextStyle(fontSize: Helper.getAdaptiveText(context, 14)),
                controller: widget.alamatController,
                // enabled: (state is LocationLoaded) ? false : true,
                // style: TextStyle(
                //     color: (state is LocationLoaded)
                //         ? Colors.black45
                //         : Colors.black),
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                    icon: Icon(Icons.pin_drop),
                    hintText: "Alamat",
                    hintStyle: TextStyle(
                        fontSize: Helper.getAdaptiveText(context, 14.0))),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Masukkan alamat' : null,
                onSaved: (String? value) {
                  log("$value saved");
                },
              ),
            );
          },
        ),
        SizedBox(
          height: 18.0,
        ),
        Row(
          children: [
            Text(
              'Jenis kelamin :',
              style: TextStyle(fontSize: Helper.getAdaptiveText(context, 12.0)),
            ),
            LabeledRadio(
                label: 'Laki-laki',
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                groupValue: _gender!,
                value: Gender.laki_laki,
                onChanged: (Gender newGender) {
                  setState(() {
                    _gender = newGender;
                  });
                  widget.genderValueCallback(newGender);
                }),
            LabeledRadio(
                label: 'Perempuan',
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                groupValue: _gender!,
                value: Gender.perempuan,
                onChanged: (Gender newGender) {
                  setState(() {
                    _gender = newGender;
                  });
                  widget.genderValueCallback(newGender);
                })
          ],
        )

        // TextFormField(
        //   controller: widget.instansiController,
        //   decoration: const InputDecoration(
        //     icon: Icon(Icons.local_hospital),
        //     hintText: "Instansi Kesehatan terdekat",
        //   ),
        //   onSaved: (String? value) {
        //     log("$value saved");
        //   },
        // )
      ],
    );
  }
}
