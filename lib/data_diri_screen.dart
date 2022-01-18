import 'dart:developer';

import 'package:ed_call/bloc/location_bloc.dart';
import 'package:ed_call/bloc/location_state.dart';
import 'package:ed_call/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataDiriScreen extends StatefulWidget {
  late TextEditingController? nameController,
      telpController,
      alamatController,
      instansiController;
  final Function(String) alamatControllerCallback;
  DataDiriScreen(
      {Key? key,
      required this.alamatControllerCallback,
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
            controller: widget.nameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Nama",
            ),
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
            controller: widget.telpController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: "No. Telepon",
            ),
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
        BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoaded) {
              widget.alamatController =
                  TextEditingController(text: state.address);
              widget.alamatControllerCallback(state.address);
            }
            return Form(
              key: formKeys[2],
              child: TextFormField(
                controller: widget.alamatController,
                enabled: (state is LocationLoaded) ? false : true,
                style: TextStyle(
                    color: (state is LocationLoaded)
                        ? Colors.black45
                        : Colors.black),
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  icon: Icon(Icons.pin_drop),
                  hintText: "Alamat",
                ),
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
        TextFormField(
          controller: widget.instansiController,
          decoration: const InputDecoration(
            icon: Icon(Icons.local_hospital),
            hintText: "Instansi Kesehatan terdekat",
          ),
          onSaved: (String? value) {
            log("$value saved");
          },
        )
      ],
    );
  }
}
