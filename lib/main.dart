import 'dart:developer';

import 'package:ed_call/bloc/emailSend_bloc/emailSend_bloc.dart';
import 'package:ed_call/bloc/location_bloc.dart';
import 'package:ed_call/bloc/location_event.dart';
import 'package:ed_call/constants/main_color.dart';
import 'package:ed_call/homescreen.dart';
import 'package:ed_call/repository/email_repository.dart';
import 'package:ed_call/services/api_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
];

List<GlobalKey<FormState>> kondisiFormKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
];

List<GlobalKey<FormState>> gejalaFormKey = [GlobalKey<FormState>()];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log(MainColors.palette.toString());
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
            create: (context) => LocationBloc()..add(LoadCurrentLocation())),
        BlocProvider<EmailBloc>(
          create: (context) => EmailBloc(
              emailSendRepository: EmailRepository(apiClient: ApiClient())),
        )
      ],
      child: MaterialApp(
        title: 'Ed Call',
        theme: ThemeData(primarySwatch: MainColors.palette),
        home: HomeScreen(),
      ),
    );
  }
}
