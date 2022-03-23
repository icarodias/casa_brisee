import 'package:casa_brisee/Model/wallet.dart';
import 'package:casa_brisee/Model/wallet_database.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:casa_brisee/shared/widgets/appBar.dart';
import 'package:casa_brisee/shared/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightAppBar = size.height * 0.08;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height),
        child: const AppBarCasaBrisee(title: "Carteira"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.stroke, AppColors.shape],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Saldo',
              style: TextStyle(color: AppColors.grey, fontSize: 26.72),
            ),
            FutureBuilder<List<Wallet>>(
                initialData: const [],
                future: findWallet(),
                builder: (context, snapshot) {
                  final List<Wallet> wallets = snapshot.data as List<Wallet>;
                  return Text(
                    wallets[0].money.toStringAsFixed(2),
                    style: const TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 44.62),
                  );
                }),
            SizedBox(height: size.height * 0.1),
            Text("ID_PROJECTS", style: TextStyles.captionBody),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavagationBar(
        page: 'wallet',
        heightAppBar: heightAppBar,
      ),
    );
  }
}
