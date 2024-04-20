import 'package:flutter/material.dart';
import 'package:soal_prioritas_2_dan_eksploraso/service/dicebear_service.dart';
import 'package:uuid/uuid.dart';

class HomeProvider extends ChangeNotifier {
  String _generatedImage = '';
  String get generatedImage => _generatedImage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void generateRandomImage() async {
    _isLoading = true;
    notifyListeners();
    String randomSeed = const Uuid().v1();

    _generatedImage =
        await DiceBearService().generateRandomImage(randomSeed: randomSeed);

    _isLoading = false;
    notifyListeners();
  }

  void generateImage({required String seed}) async {
    _isLoading = true;
    notifyListeners();

    _generatedImage = await DiceBearService().generateImage(seed: seed);

    _isLoading = false;
    notifyListeners();
  }
}
