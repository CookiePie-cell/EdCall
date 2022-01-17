import 'package:ed_call/models/EmailTemplate.dart';
import 'package:ed_call/services/api_client.dart';

class EmailSendRepository {
  final ApiClient apiClient;
  EmailSendRepository({required this.apiClient});

  Future<String> sendEmail(EmailTemplate email) {
    return apiClient.sendEmail(email);
  }
}
