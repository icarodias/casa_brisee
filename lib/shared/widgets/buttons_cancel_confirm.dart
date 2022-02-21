import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class ButtonsCancelAndConfirm extends StatelessWidget {
  final BuildContext contextPage;
  final Size size;
  final cancelOnPressed;
  final confirmOnPressed;
  const ButtonsCancelAndConfirm({
    Key? key,
    required this.contextPage,
    required this.size,
    required this.cancelOnPressed,
    required this.confirmOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 2.2,
              child: ElevatedButton(
                onPressed: cancelOnPressed,
                style: ElevatedButton.styleFrom(
                  primary: AppColors.shape,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  side: BorderSide(color: AppColors.delete, width: 1.5),
                ),
                child:
                    Text('Cancelar', style: TextStyle(color: AppColors.delete)),
              ),
            ),
            Container(
              width: (size.width) / 2.2,
              child: ElevatedButton(
                onPressed: confirmOnPressed,
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                ),
                child:
                    Text('Confirmar', style: TextStyles.buttonBoldBackground),
              ),
            )
          ],
        ),
      ),
    );
  }
}
