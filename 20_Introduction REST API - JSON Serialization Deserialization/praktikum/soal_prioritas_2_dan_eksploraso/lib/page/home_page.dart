import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soal_prioritas_2_dan_eksploraso/page/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _avatarNameController = TextEditingController();

  @override
  void dispose() {
    _avatarNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProviderListening = Provider.of<HomeProvider>(context);
    final homeProviderNotListening =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.only(
                    top: 80,
                    left: 50,
                    bottom: 50,
                    right: 50,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(48),
                      bottomLeft: Radius.circular(48),
                    ),
                  ),
                  child: homeProviderListening.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : (homeProvider.generatedImage.isEmpty
                          ? SvgPicture.asset('assets/images/avatar.svg')
                          : SvgPicture.string(homeProvider.generatedImage)),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
              child: TextField(
                controller: _avatarNameController,
                cursorColor: Colors.teal,
                enableSuggestions: false,
                style: const TextStyle(
                  color: Colors.teal,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.teal[50],
                  hintText: 'John',
                  hintStyle: const TextStyle(
                    color: Colors.teal,
                  ),
                  label: const Text(
                    'Enter your avatar name',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      homeProviderNotListening.generateImage(
                          seed: _avatarNameController.text);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Generate')
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      homeProviderNotListening.generateRandomImage();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.shuffle),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Randomize')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
