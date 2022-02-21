import 'package:flutter/material.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:casa_brisee/shared/themes/app_images.dart';

class AppBarCasaBrisee extends StatelessWidget {
  final String title;
  const AppBarCasaBrisee({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      color: AppColors.primary,
      child: Center(
        child: ListTile(
          title: Text("Casa Brisée", style: TextStyles.titleRegular),
          subtitle: Text(title, style: TextStyles.titleHome),
          trailing: Container(
            height: 50,
            width: 50,
            child: Image.asset(
              AppImages.logoMini,
              color: AppColors.background,
            ),
          ),
        ),
      ),
    );
  }
}
