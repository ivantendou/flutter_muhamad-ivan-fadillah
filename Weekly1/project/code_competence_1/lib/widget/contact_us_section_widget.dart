import 'package:flutter/material.dart';
import 'package:code_competence_1/constant/color_constant.dart';
import 'package:code_competence_1/constant/text_style_constant.dart';
import 'package:code_competence_1/widget/text_form_field_custom.dart';

class ContactUsSectionWidget extends StatelessWidget {
  final Key? formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final String? Function(String?)? validateUsername;
  final String? Function(String?)? validateEmail;
  final String? Function(String?)? validateMessage;
  final void Function() onPressed;

  const ContactUsSectionWidget({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.emailController,
    required this.messageController,
    this.validateUsername,
    this.validateEmail,
    this.validateMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          indent: 80,
          endIndent: 80,
          thickness: 4,
          color: ColorConstant().secondaryColor,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Kontak Kami',
          style: TextStyleConstant.titleStyle,
        ),
        const SizedBox(
          height: 24.0,
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormFieldCustom(
                labelText: 'Username',
                controller: usernameController,
                keyboardType: TextInputType.text,
                validator: validateUsername,
              ),
              const SizedBox(height: 16.0),
              TextFormFieldCustom(
                labelText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),
              const SizedBox(height: 16.0),
              TextFormFieldCustom(
                labelText: 'Pesan',
                maxLines: 5,
                controller: messageController,
                keyboardType: TextInputType.text,
                validator: validateMessage,
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    ColorConstant().primaryColor,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 24.0),
                  ),
                ),
                child: Text(
                  'Kirim',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: ColorConstant().backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
