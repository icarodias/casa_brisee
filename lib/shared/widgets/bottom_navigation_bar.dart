import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/themes/app_images.dart';
import 'package:flutter/material.dart';

class BottomNavagationBar extends StatelessWidget {
  final page;
  final heightAppBar;
  const BottomNavagationBar(
      {Key? key, required this.page, required this.heightAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (page == 'operation') {
      return Container(
        color: AppColors.background,
        height: heightAppBar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: heightAppBar,
              color: AppColors.primary,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    debugPrint('Clicou operations');
                    Navigator.pushReplacementNamed(context, '/operations');
                  },
                  iconSize: 30,
                  icon: Image.asset(
                    AppImages.logoMini,
                    color: AppColors.shape,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  debugPrint('Clicou wallet');
                  Navigator.pushReplacementNamed(context, '/wallet');
                },
                icon: Icon(
                  Icons.attach_money_outlined,
                  color: AppColors.heading,
                  size: 30,
                ),
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    debugPrint('Clicou store');
                    Navigator.pushReplacementNamed(context, '/store');
                  },
                  icon: Icon(Icons.local_mall_outlined,
                      color: AppColors.heading, size: 30)),
            ),
          ],
        ),
      );
    }
    if (page == "wallet") {
      return Container(
        color: AppColors.background,
        height: heightAppBar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: IconButton(
                onPressed: () {
                  debugPrint('Clicou operations');
                  Navigator.pushReplacementNamed(context, '/operations');
                },
                iconSize: 30,
                icon: Image.asset(
                  AppImages.logoMini,
                  color: AppColors.heading,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Container(
              height: heightAppBar,
              color: AppColors.primary,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    debugPrint('Clicou wallet');
                    Navigator.pushReplacementNamed(context, '/wallet');
                  },
                  icon: Icon(
                    Icons.attach_money_outlined,
                    color: AppColors.shape,
                    size: 30,
                  ),
                ),
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    debugPrint('Clicou store');
                    Navigator.pushReplacementNamed(context, '/store');
                  },
                  icon: Icon(Icons.local_mall_outlined,
                      color: AppColors.heading, size: 30)),
            ),
          ],
        ),
      );
    }
    return Container(
      color: AppColors.background,
      height: heightAppBar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                debugPrint('Clicou operations');
                Navigator.pushReplacementNamed(context, '/operations');
              },
              iconSize: 30,
              icon: Image.asset(
                AppImages.logoMini,
                color: AppColors.heading,
              ),
            ),
          ),
          Center(
            child: IconButton(
              onPressed: () {
                debugPrint('Clicou wallet');
                Navigator.pushReplacementNamed(context, '/wallet');
              },
              icon: Icon(
                Icons.attach_money_outlined,
                color: AppColors.heading,
                size: 30,
              ),
            ),
          ),
          Container(
            height: heightAppBar,
            color: AppColors.primary,
            child: IconButton(
              onPressed: () {
                debugPrint('Clicou store');
                Navigator.pushReplacementNamed(context, '/store');
              },
              icon: Icon(
                Icons.local_mall_outlined,
                color: AppColors.shape,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
