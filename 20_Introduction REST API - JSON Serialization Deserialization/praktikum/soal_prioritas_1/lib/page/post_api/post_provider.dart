import 'package:flutter/material.dart';
import 'package:soal_prioritas_1/model/contact_model.dart';
import 'package:soal_prioritas_1/service/api_service.dart';

class PostProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _postResponse = "";
  bool _showDialog = false;
  String _dialogMessage = "";

  bool get isLoading => _isLoading;
  String get postResponse => _postResponse;
  bool get showDialog => _showDialog;
  String get dialogMessage => _dialogMessage;

  Future<void> postContact(String name, String phoneNumber) async {
    try {
      _isLoading = true;
      notifyListeners();

      ContactModel contactData = ContactModel(
        id: 4,
        name: name,
        phone: phoneNumber,
      );

      _postResponse = await ApiService().postContact(contactData: contactData);

      _isLoading = false;
      _showDialog = true;
      _dialogMessage = _postResponse;
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
