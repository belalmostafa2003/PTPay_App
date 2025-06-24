import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ptpayapp/core/utils/model.dart';

class ApiService {
  static const String baseUrl = "https://yourapi.com/api"; // ضع رابط API هنا

  Future<UserModel> fetchUserData() async {
    final response = await http.get(Uri.parse('$baseUrl/user'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception("Failed to load user data");
    }
  }
}
