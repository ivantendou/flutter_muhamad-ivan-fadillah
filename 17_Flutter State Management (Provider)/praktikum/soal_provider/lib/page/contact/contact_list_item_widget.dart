import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/models/contact_model.dart';

class ContactListItem extends StatelessWidget {
  final List<ContactModel> contactList;
  final void Function(int) onEditPressed;
  final void Function(int) onDeletePressed;

  const ContactListItem({
    super.key,
    required this.contactList,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
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
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        child: Text(contactList[index].name[0]),
                      ),
                      title: Text(
                        contactList[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contactList[index].number),
                          Text(
                            'Date: ${DateFormat('dd-MM-yyyy h:mm:ss a').format(contactList[index].date)}',
                          ),
                          Row(
                            children: [
                              const Text('Color: '),
                              Container(
                                width: 20,
                                height: 20,
                                color: contactList[index].color,
                              ),
                            ],
                          ),
                          Text(
                              'File Name: ${contactList[index].file?.name ?? "None"}'),
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              onEditPressed(index);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              onDeletePressed(index);
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
  }
}
