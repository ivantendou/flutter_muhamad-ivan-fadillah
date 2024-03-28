import 'package:flutter/material.dart';
import 'package:code_competence_1/constant/text_style_constant.dart';

void showSuccessDialog(
    BuildContext context,
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController messageController) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
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
            },
            child: Text(
              'Oke',
              style: TextStyleConstant.subtitleStyle.copyWith(
                color: Colors.blue[700],
              ),
            ),
          )
        ],
      );
    },
  );
}
