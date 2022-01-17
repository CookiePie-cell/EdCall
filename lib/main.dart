import 'package:ed_call/bloc/emailSend_bloc/emailSend_bloc.dart';
import 'package:ed_call/bloc/location_bloc.dart';
import 'package:ed_call/bloc/location_event.dart';
import 'package:ed_call/homescreen.dart';
import 'package:ed_call/repository/emailSend_repository.dart';
import 'package:ed_call/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
            create: (context) => LocationBloc()..add(LoadCurrentLocation())),
        BlocProvider<EmailSendBloc>(
          create: (context) => EmailSendBloc(
              emailSendRepository: EmailSendRepository(apiClient: ApiClient())),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.greenAccent[700]),
        home: HomeScreen(),
      ),
    );
  }
}
