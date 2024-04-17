import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:soal_storage/utils/constant/color_constant.dart';
import 'package:soal_storage/utils/constant/route_path_constant.dart';
import 'package:soal_storage/utils/constant/text_style_constant.dart';
import 'package:soal_storage/utils/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool isNewUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void checkLogin() async {
    bool? loginData = await SharedPref.getLoginSession();
    isNewUser = loginData ?? true;

    if (isNewUser == false) {
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePath.contact,
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contact App',
                style: TextStyleConstant.poppinsSemiBold.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle_rounded),
                  labelText: 'Username',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  fillColor: Colors.purple[50],
                  filled: true,
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_rounded),
                  labelText: 'Email',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  fillColor: Colors.purple[50],
                  filled: true,
                ),
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password_rounded),
                  labelText: 'Password',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  fillColor: Colors.purple[50],
                  filled: true,
                ),
                validator: (value) {
                  if (value != null && value.length < 5) {
                    return 'Enter min. 5 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final isValidForm = formKey.currentState!.validate();
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  if (isValidForm) {
                    await SharedPref.saveAccountInfo(
                      name: name,
                      email: email,
                      password: password,
                    );
                    SharedPref.saveLoginSession(loginData: false);
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutePath.contact,
                        (route) => false,
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    ColorConstant.backgroundColor,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
