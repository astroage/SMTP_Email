import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smtp_email/widgets/email_invalid.dart';
import 'package:smtp_email/widgets/email_valid.dart';


class EmailValidation {
  static const apiKey = 'f51f5ebfec5745658f1837c5cce6cf09';

  static Future<Object> validateEmail(String email) async {
    final url =
        'https://emailreputation.abstractapi.com/v1/?api_key=$apiKey&email=$email';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final deliverability = data['email_deliverability']['status'];
         final int breaches = data['email_breaches']['total_breaches'];
         final double score = double.tryParse(data['email_quality']['score'].toString()) ?? 0.0;


        if (deliverability == 'deliverable' && breaches == 0 && score > 0.5) {
          return EmailValid(breaches: breaches, score: score);
        } else {
          return EmailInvalid(breaches: breaches, score: score,);
        }
      } else {
        return 'API Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
