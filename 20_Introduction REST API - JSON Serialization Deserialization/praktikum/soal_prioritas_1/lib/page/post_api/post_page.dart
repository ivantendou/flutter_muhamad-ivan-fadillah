import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas_1/constant/route_paths_constant.dart';
import 'package:soal_prioritas_1/page/post_api/post_provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POST API',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: 'Enter your name',
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Text must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: 'Enter your phone number',
                        labelText: 'Phone Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Text must not be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await postProvider.postContact(
                            _nameController.text,
                            _phoneNumberController.text,
                          );
                          _nameController.clear();
                          _phoneNumberController.clear();
                          if (context.mounted) {
                            showAlertDialog(context, postProvider.postResponse);
                          }
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.indigo),
                      ),
                      child: const Text(
                        'POST',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          postProvider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                )
              : Container(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('No 1. POST API'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('No 2. GET API'),
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.getPage);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('No 3. PUT API'),
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.put);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String postResponse) {
    showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: const Icon(
            Icons.info,
            size: 50,
          ),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(postResponse),
              ],
            ),
          ),
        );
      },
    );
  }
}
