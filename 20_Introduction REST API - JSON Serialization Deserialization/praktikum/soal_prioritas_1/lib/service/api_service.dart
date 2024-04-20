import 'package:soal_prioritas_1/constant/api_constant.dart';
import 'package:soal_prioritas_1/model/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:soal_prioritas_1/model/put_request_model.dart';

class ApiService {
  final dio = Dio();

  Future<String> postContact({
    required ContactModel contactData,
  }) async {
    try {
      String url = ApiConstant.postUrl;
      var response = await dio.post(
        url,
        data: contactModelToJson(contactData),
      );
      if (response.statusCode == 201) {
        return 'User Created Successfully';
      }
      return 'Failed to Create User';
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> putContact({
    required PutRequestModel putRequestData,
  }) async {
    try {
      String url = ApiConstant.putUrl;
      var response = await dio.put(
        url,
        data: putRequestModelToJson(putRequestData),
      );
      if (response.statusCode == 200) {
        return 'Update data Successfully';
      }
      return 'Failed to Update Data';
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ContactModel> getContact() async {
    try {
      String url = ApiConstant.getUrl;
      var response = await dio.get(url);
      ContactModel contactData = ContactModel.fromJson(response.data);
      return contactData;
    } catch (e) {
      throw Exception(e);
    }
  }
}
