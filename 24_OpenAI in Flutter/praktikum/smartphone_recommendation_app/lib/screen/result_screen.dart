import 'package:flutter/material.dart';
import 'package:smartphone_recommendation_app/models/open_ai.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.gptResponseData,
  });
  final GptData gptResponseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Recommendations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              gptResponseData.choices[0].message?.content ?? "-",
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
