import 'package:casa_brisee/Model/start_database.dart';
import 'package:casa_brisee/pages/splash/splash_page.dart';
import 'package:casa_brisee/pages/operation/operations_page.dart';
import 'package:casa_brisee/pages/operation/operations_form_page.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'Model/operation_database.dart';
import 'Model/store_database.dart';
import 'pages/store/store_form_page.dart';
import 'pages/wallet/wallet_page.dart';
import 'pages/store/store_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // INIT OF DATABASE AND COUNT THE OPERATIONS
  createdDb() async {
    debugPrint("entrei aqui");
    await keepNumberOfOperationsFixed(5);
    int numberOfProduct = await numberOfProducts();
    debugPrint("$numberOfProduct");
    Future.delayed(const Duration(milliseconds: 500),
        () => {start_database(numberOfProduct == 0)});
  }

  @override
  Widget build(BuildContext context) {
    createdDb();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casa Briseé',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/operations': (context) => const OperationsPage(),
        '/operations_form': (context) => const OperationsFormPage(),
        '/store': (context) => const StorePage(),
        '/store_form': (context) => const StoreFormPage(),
        '/wallet': (context) => const WalletPage(),
      },
    );
  }
}
