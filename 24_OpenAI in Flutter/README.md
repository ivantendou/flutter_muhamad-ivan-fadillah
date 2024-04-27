# (24) OpenAI in Flutter

1. OpenAI adalah sebuah *library* yang dapat digunakan untuk memanfaatkan teknologi AI (Artificial Intelligence) yang disediakan oleh OpenAI. *Library* ini nantinya dapat diintegrasikan dengan berbagai aplikasi seperti API, web, dan *mobile*.

2. Untuk mengintegrasikan dengan aplikasi *mobile*, pertama-tama kita harus mendapatkan API Key dulu dari OpenAI. API Key ini akan kita gunakan ketika nanti melakukan request ke endpoint OpenAI. Lalu ketika melakukan request kita perlu memasukkan beberapa *request* body yang diperlukan seperti model, messages, temperature, dll.

Berikut adalah contoh class untuk melakuan request POST ke OpenAI.
```dart
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
```

3. Data response yang kita dapat tentunya perlu ditampung pada sebuah class model. Maka dari itu kita perlu menyesuaikan class model tersebut dengan response dari OpenAI. Berikut adalah class model-nya.
```dart
import 'dart:convert';

GptData gptDataFromJson(String str) => GptData.fromJson(json.decode(str));

String gptDataToJson(GptData data) => json.encode(data.toJson());

class GptData {
  GptData({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.systemFingerprint,
  });

  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;
  Usage usage;
  String? systemFingerprint;

  factory GptData.fromJson(Map<String, dynamic> json) => GptData(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
        systemFingerprint: json["system_fingerprint"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
        "system_fingerprint": systemFingerprint,
      };
}

class Choice {
  Choice({
    this.index,
    this.message,
    this.logprobs,
    this.finishReason,
  });

  int? index;
  Message? message;
  dynamic logprobs;
  String? finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        index: json["index"],
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "message": message?.toJson(),
        "logprobs": logprobs,
        "finish_reason": finishReason,
    };
}

class Message {
    String? role;
    String? content;

    Message({
        this.role,
        this.content,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
    };
}

class Usage {
  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  int promptTokens;
  int completionTokens;
  int totalTokens;

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "comletion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}

```