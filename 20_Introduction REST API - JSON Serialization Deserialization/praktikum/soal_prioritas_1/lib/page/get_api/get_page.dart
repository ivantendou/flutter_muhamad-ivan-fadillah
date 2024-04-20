import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas_1/constant/route_paths_constant.dart';
import 'package:soal_prioritas_1/model/contact_model.dart';
import 'package:soal_prioritas_1/page/get_api/get_provider.dart';

class GetPage extends StatefulWidget {
  const GetPage({super.key});

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<GetProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GET API',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () async {
                  await getProvider.getData();
                  try {
                    await getProvider.getData();
                    if (getProvider.contactData != null) {
                      showContactDialog(getProvider.contactData);
                    } else {
                      showErrorDialog('Failed to load contact data.');
                    }
                  } catch (e) {
                    showErrorDialog('Failed to load contact data: $e');
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.indigo),
                ),
                child: const Text(
                  'GET',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          getProvider.isLoading
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
                Navigator.pop(context);
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

  void showContactDialog(ContactModel? contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Get Contact Result'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${contact?.name ?? ''}'),
              Text('Phone: ${contact?.phone ?? ''}'),
              Text('id: ${contact?.id ?? ''}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
