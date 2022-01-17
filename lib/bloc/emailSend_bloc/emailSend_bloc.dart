import 'dart:developer';

import 'package:ed_call/bloc/emailSend_bloc/emailSend_event.dart';
import 'package:ed_call/bloc/emailSend_bloc/emailSend_state.dart';
import 'package:ed_call/repository/emailSend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailSendBloc extends Bloc<EmailSendEvent, EmailSendState> {
  final EmailSendRepository emailSendRepository;
  EmailSendBloc({required this.emailSendRepository}) : super(InitialEmail()) {
    on<SendEmail>(_sendEmail);
  }

  void _sendEmail(EmailSendEvent event, Emitter<EmailSendState> emit) async {
    emit(EmailSending());
    try {
      log('trying');
      final email = await emailSendRepository.sendEmail(event.email);
      log('Wkwkwkwkwkwk');
      emit(EmailSended(email));
      log(state.toString());
    } catch (e) {
      log(e.toString());
      emit(EmailSendFailed());
    }
  }
}
