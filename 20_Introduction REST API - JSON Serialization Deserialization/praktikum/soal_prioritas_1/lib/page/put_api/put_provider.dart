import 'package:flutter/material.dart';
import 'package:soal_prioritas_1/model/put_request_model.dart';
import 'package:soal_prioritas_1/service/api_service.dart';

class PutProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _putResponse = "";
  bool _showDialog = false;
  String _dialogMessage = "";

  bool get isLoading => _isLoading;
  String get putResponse => _putResponse;
  bool get showDialog => _showDialog;
  String get dialogMessage => _dialogMessage;

  Future<void> putContact(String title, String body, int userId) async {
    try {
      _isLoading = true;
      notifyListeners();

      PutRequestModel putRequestData = PutRequestModel(
        id: 1,
        title: title,
        body: body,
        userId: userId,
      );

      _putResponse =
          await ApiService().putContact(putRequestData: putRequestData);

      _isLoading = false;
      _showDialog = true;
      _dialogMessage = _putResponse;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void closeDialog() {
    _showDialog = false;
    notifyListeners();
  }
}
