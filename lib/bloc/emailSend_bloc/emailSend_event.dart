import 'package:ed_call/models/EmailTemplate.dart';
import 'package:equatable/equatable.dart';

abstract class EmailSendEvent extends Equatable {
  final EmailTemplate email;
  const EmailSendEvent(this.email);

  @override
  List<Object?> get props => [this.email];
}

class SendEmail extends EmailSendEvent {
  const SendEmail(EmailTemplate email) : super(email);
}

class StoreEmail extends EmailSendEvent {
  const StoreEmail(EmailTemplate email) : super(email);
}
