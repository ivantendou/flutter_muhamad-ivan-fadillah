import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:smartphone_recommendation_app/constant/open_ai.dart';
import 'package:smartphone_recommendation_app/models/open_ai.dart';
import 'package:intl/intl.dart';

class RecommendationService {
  static Future<GptData> getRecommendations({
    required String budget,
    required String camera,
    required String internalStorage,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        completionTokens: 0,
        promptTokens: 0,
        totalTokens: 0,
      ),
      systemFingerprint: "",
    );

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      };

      String smartphoneBudget = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR ',
        decimalDigits: 0,
      ).toString();

      String promptData =
          "You are a smartphone expert. Please give me a smartphone recommendation with $camera camera and $internalStorage internal storage capacity with budget equals to $smartphoneBudget";

      final data = jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": promptData,
          }
        ],
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });

      var response = await Dio().post(
        'https://api.openai.com/v1/chat/completions',
        data: data,
        options: Options(
          headers: headers,
        )
      );

      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.data);
      }
    } catch (e) {
      throw Exception('Error occured when sending request');
    }

    return gptData;
  }
}
