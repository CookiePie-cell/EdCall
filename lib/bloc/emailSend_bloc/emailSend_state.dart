import 'package:ed_call/models/EmailTemplate.dart';
import 'package:equatable/equatable.dart';

abstract class EmailSendState extends Equatable {
  const EmailSendState();
  @override
  List<Object?> get props => [];
}

class InitialEmail extends EmailSendState {
  const InitialEmail();

  @override
  List<Object?> get props => [];
}

class EmailSended extends EmailSendState {
  final String message;
  const EmailSended(this.message);

  @override
  List<Object?> get props => [this.message];
}

class EmailSending extends EmailSendState {
  const EmailSending();

  @override
  List<Object?> get props => [];
}

class EmailSendFailed extends EmailSendState {
  const EmailSendFailed();

  @override
  List<Object?> get props => [];
}
