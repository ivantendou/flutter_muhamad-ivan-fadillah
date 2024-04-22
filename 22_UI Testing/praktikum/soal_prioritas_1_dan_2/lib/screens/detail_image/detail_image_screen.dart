import 'package:flutter/material.dart';

class DetailImageScreen extends StatelessWidget {
  const DetailImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String imagePath =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Detail Image'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            ),
          ),
        ));
  }
}
