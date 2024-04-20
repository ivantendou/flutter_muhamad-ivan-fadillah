import 'package:flutter/material.dart';
import 'package:soal_prioritas_1/model/contact_model.dart';
import 'package:soal_prioritas_1/service/api_service.dart';

class GetProvider extends ChangeNotifier {
  ContactModel? _contactData;
  bool _isLoading = false;

  ContactModel? get contactData => _contactData;
  bool get isLoading => _isLoading;

  Future<void> getData() async {
    _isLoading = true;
    notifyListeners();

    _contactData = await ApiService().getContact();

    _isLoading = false;
    notifyListeners();
  }
}
