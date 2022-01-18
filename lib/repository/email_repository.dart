import 'package:ed_call/models/EmailTemplate.dart';
import 'package:ed_call/services/api_client.dart';

class EmailRepository {
  final ApiClient apiClient;

  EmailRepository({required this.apiClient});

  Future<String> sendEmail(EmailTemplate email) {
    return apiClient.sendEmail(email);
  }

  Future<void> storeEmail(EmailTemplate email) {
    return apiClient.storeEmail(email);
  }
}
