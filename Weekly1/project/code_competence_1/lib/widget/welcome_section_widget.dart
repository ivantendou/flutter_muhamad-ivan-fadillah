import 'package:flutter/material.dart';
import 'package:code_competence_1/constant/color_constant.dart';
import 'package:code_competence_1/constant/text_style_constant.dart';

class WelcomeSectionWidget extends StatelessWidget {
  const WelcomeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/welcome.png',
          width: 300.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.waving_hand,
              size: 48.0,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hai, Ivan',
                    style: TextStyleConstant.titleStyle,
                  ),
                  Text(
                    'Selamat datang di QuickConnect!',
                    style: TextStyleConstant.contentStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Divider(
          indent: 80,
          endIndent: 80,
          thickness: 4,
          color: ColorConstant().secondaryColor,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: ColorConstant().secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              const Icon(
                Icons.electric_bolt,
                size: 48.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'QuickConnect adalah aplikasi yang memudahkan pengguna untuk terhubung dengan orang-orang yang penting bagi mereka dengan cepat dan tanpa kerumitan. Dengan fokus pada keterjangkauan dan kemudahan penggunaan, QuickConnect menyediakan platform yang intuitif dan responsif untuk memfasilitasi komunikasi yang efisien',
                textAlign: TextAlign.center,
                style: TextStyleConstant.contentStyle,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Kenapa Harus QuickConnect?',
                style: TextStyleConstant.subtitleStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.flash_on,
                    size: 32.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Text(
                      'Sederhana dan Cepat: Antarmuka yang mudah digunakan memungkinkan pengguna untuk terhubung dengan cepat.',
                      style: TextStyleConstant.contentStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    size: 32.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Text(
                      'Beragam Pilihan Komunikasi: Dari panggilan hingga pesan instan, Quick Connect menyediakan semua opsi komunikasi dalam satu aplikasi.',
                      style: TextStyleConstant.contentStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.security,
                    size: 32.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Text(
                      'Keterjangkauan dan Keamanan: Dengan fokus pada keamanan dan privasi, Quick Connect memberikan pengalaman komunikasi yang aman dan terpercaya.',
                      style: TextStyleConstant.contentStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
