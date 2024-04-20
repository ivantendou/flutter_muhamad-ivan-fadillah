import 'package:dio/dio.dart';

class DiceBearService {
  final dio = Dio();

  Future<String> generateRandomImage({required String randomSeed}) async {
    try {
      final response = await dio
          .get('https://api.dicebear.com/8.x/adventurer/svg?seed=$randomSeed');
      return response.data as String;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> generateImage({required String seed}) async {
    try {
      final response = await dio
          .get('https://api.dicebear.com/8.x/adventurer/svg?seed=$seed');
      return response.data as String;
    } catch (e) {
      throw Exception(e);
    }
  }
}
