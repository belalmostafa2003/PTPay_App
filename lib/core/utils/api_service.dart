import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = 'https://ahmed80800.pythonanywhere.com/api/';

  ApiService(this.dio);

  Future<Map<String, dynamic>?> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio.post(
        baseUrl + endpoint,
        data: data,
      );
      return response.data;
    } on DioError catch (e) {
      print("DioError: ${e.response?.statusCode} ${e.response?.data}");
      return {"error": e.response?.data ?? e.message};
    } catch (e) {
      print("Error during POST request: $e");
      return {"error": "حدث خطأ في الاتصال بالخادم"};
    }
  }

  Future<Map<String, dynamic>?> postFormData({
    required String endpoint,
    required FormData data,
  }) async {
    try {
      final response = await dio.post(
        baseUrl + endpoint,
        data: data,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return response.data;
    } on DioError catch (e) {
      print("DioError FormData: ${e.response?.statusCode} ${e.response?.data}");
      return {"error": e.response?.data ?? e.message};
    } catch (e) {
      print("Error during POST FormData: $e");
      return {"error": "فشل في إرسال البيانات إلى الخادم"};
    }
  }
}


