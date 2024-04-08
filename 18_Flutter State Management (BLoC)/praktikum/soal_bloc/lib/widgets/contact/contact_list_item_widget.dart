import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:soal_bloc/bloc/bloc_barrel.dart';

class ContactListItem extends StatelessWidget {
  final void Function(
    int index,
    String name,
    String number,
    DateTime date,
    Color color,
    PlatformFile? file,
    bool isEditing,
  ) onEditPressed;
  final void Function(int index) onDeletePressed;
  const ContactListItem({
    super.key,
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
        BlocBuilder<CrudContactBloc, CrudContactState>(
          builder: (context, state) {
            if (state.contactList.isEmpty) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
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
                ],
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.contactList.length,
                itemBuilder: (context, index) {
                  var data = state.contactList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        child: Text(state.contactList[index].name[0]),
                      ),
                      title: Text(
                        state.contactList[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.contactList[index].number),
                          Text(
                            'Date: ${DateFormat('dd-MM-yyyy h:mm:ss a').format(state.contactList[index].date)}',
                          ),
                          Row(
                            children: [
                              const Text('Color: '),
                              Container(
                                width: 20,
                                height: 20,
                                color: state.contactList[index].color,
                              ),
                            ],
                          ),
                          Text(
                              'File Name: ${state.contactList[index].file?.name ?? "None"}'),
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              onEditPressed(
                                index,
                                data.name,
                                data.number,
                                data.date,
                                data.color,
                                data.file,
                                true,
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              onDeletePressed(
                                index,
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
