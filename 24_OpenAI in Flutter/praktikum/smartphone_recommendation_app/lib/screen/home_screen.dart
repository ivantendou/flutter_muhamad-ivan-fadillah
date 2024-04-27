import 'package:flutter/material.dart';
import 'package:smartphone_recommendation_app/screen/result_screen.dart';
import 'package:smartphone_recommendation_app/services/recommendation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  bool isLoading = false;

  void _getRecommendation() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        budget: _budgetController.text,
        camera: _cameraController.text,
        internalStorage: _storageController.text,
      );

      if (context.mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again'),
      );

      setState(() {
        isLoading = false;
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Phone Recommendations',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _budgetController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    label: const Text('Budget'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cameraController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    label: const Text('Camera (MP)'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _storageController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    label: const Text('Internal Storage'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: _getRecommendation,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                      50.0,
                    ),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: isLoading && _formKey.currentState!.validate() != false
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text("Get Recommendations"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
