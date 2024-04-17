import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_storage/models/account_model.dart';
import 'package:soal_storage/models/db_manager.dart';
import 'package:soal_storage/utils/constant/route_path_constant.dart';
import 'package:soal_storage/utils/constant/text_style_constant.dart';
import 'package:soal_storage/utils/shared_preferences.dart';

class ProfileSheet extends StatefulWidget {
  const ProfileSheet({super.key});

  @override
  State<ProfileSheet> createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet> {
  AccountModel? accountInfo;
  String? username;
  String? email;

  @override
  void initState() {
    super.initState();
    getAccountInfo();
  }

  void getAccountInfo() async {
    accountInfo = await SharedPref.getAccountInfo();
    username = accountInfo?.name;
    email = accountInfo?.email;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_pic.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              username ?? 'User',
              style: TextStyleConstant.poppinsBold.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              email ?? 'user@gmail.com',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                SharedPref.saveLoginSession(loginData: true);
                SharedPref.removeAllKey();
                Provider.of<DbManager>(context, listen: false)
                    .deleteDatabaseOnLogout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutePath.login,
                  (route) => false,
                );
              },
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
