import 'package:flutter/material.dart';
import 'package:code_competence_1/constant/color_constant.dart';
import 'package:code_competence_1/constant/text_style_constant.dart';
import 'package:code_competence_1/widget/welcome_section_widget.dart';
import 'package:code_competence_1/widget/contact_us_section_widget.dart';

class MessageModel {
  final String username;
  final String email;
  final String message;

  MessageModel({
    required this.username,
    required this.email,
    required this.message,
  });
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPage();
}

class _ContactPage extends State<ContactPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<MessageModel> messageList = [];

  String? validateUsername(String? value) {
    if (value?.isEmpty == true) {
      return 'Username must not be empty.';
    } else if ((value?.length ?? 0) < 2) {
      return 'The username must consist of at least 2 words.';
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value!)) {
      return 'Name should not contain special characters or numbers.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty == true) {
      return 'Email must not be empty.';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value?.isEmpty == true) {
      return 'Message must not be empty.';
    }
    return null;
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      messageList.add(MessageModel(
        username: usernameController.text,
        email: emailController.text,
        message: messageController.text,
      ));

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              title: const Column(
                children: [
                  Icon(Icons.check_circle),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Pesan Berhasil Dikirim',
                  ),
                ],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Username: ${usernameController.text}',
                    style: TextStyleConstant.contentStyle,
                  ),
                  Text(
                    'Email: ${emailController.text}',
                    style: TextStyleConstant.contentStyle,
                  ),
                  Text(
                    'Pesan: ${messageController.text}',
                    style: TextStyleConstant.contentStyle,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    usernameController.clear();
                    emailController.clear();
                    messageController.clear();
                    setState(() {});
                  },
                  child: Text(
                    'Oke',
                    style: TextStyleConstant.subtitleStyle.copyWith(
                      color: Colors.blue[700],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant().backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant().primaryColor,
        title: Text(
          'QuickConnect',
          style: TextStyleConstant.titleStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorConstant().backgroundColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const WelcomeSectionWidget(),
              const SizedBox(
                height: 16.0,
              ),
              ContactUsSectionWidget(
                formKey: _formKey,
                usernameController: usernameController,
                emailController: emailController,
                messageController: messageController,
                validateUsername: validateUsername,
                validateEmail: validateEmail,
                validateMessage: validateMessage,
                onPressed: onSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
