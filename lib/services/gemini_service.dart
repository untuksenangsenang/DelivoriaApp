import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String _apiKey = 'AIzaSyANCxW4eyqCzb90yKytzRCTa9PgsEcoPiU'; // Replace with your actual API key
  static const String _url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

  static Future<String?> generateResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse("$_url?key=$_apiKey"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final content =
            jsonResponse['candidates'][0]['content']['parts'][0]['text'];
        return content;
      } else {
        print("Error ${response.statusCode}: ${response.body}");
        return "Maaf, terjadi kesalahan.";
      }
    } catch (e) {
      print("Exception: $e");
      return "Maaf, terjadi kesalahan koneksi.";
    }
  }
}
