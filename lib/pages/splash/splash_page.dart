import 'package:casa_brisee/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initState(context);
    final size = MediaQuery.of(context).size;
    final sizeImage = size.height * 0.3;

    return Scaffold(
        backgroundColor: AppColors.secondary,
        body: Center(
          child: Image.asset(AppImages.logoFull,
              height: sizeImage, width: sizeImage),
        ));
  }

  void initState(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, '/operations');
  }
}
