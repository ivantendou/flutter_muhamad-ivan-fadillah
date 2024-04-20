import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas_1/constant/route_paths_constant.dart';
import 'package:soal_prioritas_1/page/put_api/put_provider.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _userIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _userIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final putProvider = Provider.of<PutProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PUT API',
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
                      controller: _titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: 'Enter the title',
                        labelText: 'Title',
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
                      controller: _bodyController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: 'Enter data desription',
                        labelText: 'Body',
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
                      controller: _userIdController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: 'Enter your user ID',
                        labelText: 'User ID',
                      ),
                      keyboardType: TextInputType.phone,
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
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await putProvider.putContact(
                            _titleController.text,
                            _bodyController.text,
                            int.parse(_userIdController.text),
                          );
                          _titleController.clear();
                          _bodyController.clear();
                          _userIdController.clear();
                          if (context.mounted) {
                            showAlertDialog(context, putProvider.putResponse);
                          }
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.indigo),
                      ),
                      child: const Text(
                        'PUT',
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
          putProvider.isLoading
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
                Navigator.pushNamed(context, RoutePaths.post);
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
                Navigator.pop(context);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String putResponse) {
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
                Text(putResponse),
              ],
            ),
          ),
        );
      },
    );
  }
}
