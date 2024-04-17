import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soal_storage/models/db_manager.dart';

class ContactListItemWidget extends StatelessWidget {
  final void Function(int) onEditPressed;

  const ContactListItemWidget({
    super.key,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DbManager>(
      builder: (context, provider, child) {
        final contactList = provider.contactModels;
        return Column(
          children: [
            const Text(
              'List Contacts',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 16.0,
            ),
            contactList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24.0,
                        ),
                        Icon(
                          Icons.contact_emergency,
                          size: 24,
                        ),
                        Text('Empty contact'),
                        SizedBox(
                          height: 24.0,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contactList.length,
                    itemBuilder: (context, index) {
                      final item = contactList[index];

                      return Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            child: Text(item.name[0]),
                          ),
                          title: Text(
                            item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.number),
                              Text(
                                'Date: ${DateFormat('dd-MM-yyyy h:mm:ss a').format(item.date)}',
                              ),
                              Row(
                                children: [
                                  const Text('Color: '),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    color: item.color,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  onEditPressed(item.id ?? -1);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  provider.deleteContact(item.id!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('${item.name} Deleted')),
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        );
      },
    );
  }
}
