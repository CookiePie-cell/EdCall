import 'dart:developer';

import 'package:ed_call/bloc/emailSend_bloc/emailSend_bloc.dart';
import 'package:ed_call/bloc/emailSend_bloc/emailSend_event.dart';
import 'package:ed_call/bloc/emailSend_bloc/emailSend_state.dart';
import 'package:ed_call/constants/info_constants.dart';
import 'package:ed_call/data_diri_screen.dart';
import 'package:ed_call/gejala_step.dart';
import 'package:ed_call/helper/helper.dart';
import 'package:ed_call/kondisi_step.dart';
import 'package:ed_call/kontak_screen.dart';
import 'package:ed_call/main.dart';
import 'package:ed_call/models/EmailTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaporScreen extends StatefulWidget {
  const LaporScreen({Key? key}) : super(key: key);

  @override
  _LaporScreenState createState() => _LaporScreenState();
}

class _LaporScreenState extends State<LaporScreen> {
  late EmailTemplate email;
  int _currentStep = 0;
  // Data Diri
  TextEditingController nameController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController instansiController = TextEditingController();
  Gender gender = Gender.laki_laki;

  // Kondisi
  TextEditingController kondisiController = TextEditingController();
  TextEditingController perjalananController = TextEditingController();
  String dropdownValue = '1x';

  // Gejala
  Map<String, bool> gejala = {
    'Demam/Panas': false,
    'Kelelahan': false,
    'Batuk': false,
    'Flu/Pilek': false,
    'Hilang Penciuman': false,
    'Hilang rasa': false
  };
  TextEditingController gejalaController = TextEditingController();
  List<Step> get stepList => [
        Step(
            title: Text(
              'Data diri',
              style: TextStyle(fontSize: Helper.getAdaptiveText(context, 13.0)),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep >= 0,
            content: DataDiriScreen(
              alamatControllerCallback: (String alamat) {
                alamatController = TextEditingController(text: alamat);
              },
              genderValueCallback: (Gender newGender) {
                gender = newGender;
              },
              nameController: nameController,
              telpController: telpController,
              alamatController: alamatController,
              instansiController: instansiController,
            )),
        Step(
            title: Text('Kondisi',
                style:
                    TextStyle(fontSize: Helper.getAdaptiveText(context, 13.0))),
            state: _currentStep > 1 ? StepState.complete : StepState.editing,
            isActive: _currentStep >= 1,
            content: KondisiStep(
              kondisiController: kondisiController,
              perjalananController: perjalananController,
              onChangeCallback: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },
              dropdownValue: dropdownValue,
            )),
        Step(
            title: Text('Gejala',
                style:
                    TextStyle(fontSize: Helper.getAdaptiveText(context, 13.0))),
            state: _currentStep > 2 ? StepState.complete : StepState.editing,
            isActive: _currentStep >= 2,
            content: GejalaStep(
              gejala: gejala,
              gejalaController: gejalaController,
              onChangedCallback: (key, value) {
                gejala[key] = value!;
              },
            )),
      ];

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
                  'Lapor',
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
      body: BlocConsumer<EmailBloc, EmailSendState>(listener: (context, state) {
        log(state.toString());
        if (state is EmailSended) {
          log('terkirim');
          context.read<EmailBloc>().add(StoreEmail(email));
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Berhasil terkirim')));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => KontakScreen()),
              (Route<dynamic> route) => false);
        } else if (state is EmailSending) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Mengirim')));
        } else if (state is EmailSendFailed) {
          log('gagal');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Gagal mengirim')));
        }
      }, builder: (context, state) {
        return Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: controls.onStepCancel,
                      child: _currentStep > 0
                          ? Text(
                              "Kembali",
                              style: TextStyle(
                                  fontSize:
                                      Helper.getAdaptiveText(context, 14.0)),
                            )
                          : Container()),
                  ElevatedButton(
                    onPressed:
                        state is EmailSending ? null : controls.onStepContinue,
                    child: _currentStep < 2
                        ? Text('Lanjut',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Helper.getAdaptiveText(context, 14.0),
                            ))
                        : state is EmailSending
                            ? Text('Mengirim',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      Helper.getAdaptiveText(context, 14.0),
                                ))
                            : Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      Helper.getAdaptiveText(context, 14.0),
                                ),
                              ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                        backgroundColor: state is EmailSending
                            ? MaterialStateProperty.all(Colors.grey)
                            : MaterialStateProperty.all(
                                Colors.greenAccent[700]),
                        minimumSize: MaterialStateProperty.all(
                            Size(size.width * 0.25, size.height * 0.05)),
                        elevation: MaterialStateProperty.all(8.0)),
                  )
                ],
              ),
            );
          },
          type: StepperType.horizontal,
          steps: stepList,
          currentStep: _currentStep,
          onStepTapped: (index) {
            setState(() {
              if (index > _currentStep) {
                if (index == 2 &&
                    _isValidated(formKeys) &&
                    !(_isValidated(kondisiFormKeys))) {
                  _currentStep = 1;
                } else if (_currentStep == 0 && _isValidated(formKeys)) {
                  _currentStep = index;
                  log('is dis wokring?');
                } else if (_currentStep == 1 && _isValidated(kondisiFormKeys)) {
                  _currentStep = index;
                }
              } else {
                _currentStep = index;
              }
            });
            log(gejala.toString());
          },
          onStepContinue: () {
            if (_currentStep < stepList.length - 1) {
              setState(() {
                if (_currentStep == 0 && _isValidated(formKeys)) {
                  _currentStep++;
                } else if (_currentStep == 1 && _isValidated(kondisiFormKeys)) {
                  _currentStep++;
                }
              });
            } else {
              if (_isValidated(gejalaFormKey)) {
                email = EmailTemplate(
                    targetEmail: InfoConstant.TARGET_EMAIL,
                    nama: nameController.text,
                    telepon: telpController.text,
                    alamat: alamatController.text,
                    gender: gender,
                    kondisi: kondisiController.text,
                    vaksinasi: dropdownValue,
                    riwayatPerjalanan: perjalananController.text,
                    gejala: gejala,
                    gejalaLain: gejalaController.text);
                context.read<EmailBloc>().add(SendEmail(email));
                log(gender.toString());
              }
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep--;
              });
              log(dropdownValue);
            }
          },
        );
      }),
    );
  }

  bool _isValidated(List<GlobalKey<FormState>> keys) {
    int notValidated = 0;

    for (int i = 0; i < keys.length; i++) {
      if (!keys[i].currentState!.validate()) {
        notValidated++;
      }
    }
    return notValidated < 1 ? true : false;
  }
}
