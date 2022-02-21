import 'package:casa_brisee/Model/product.dart';
import 'package:casa_brisee/Model/store_database.dart';
import 'package:casa_brisee/Model/wallet_database.dart';
import 'package:casa_brisee/shared/themes/app_images.dart';

void start_database(bool isThereNoProduct) {
  if (isThereNoProduct) {
    createWallet(0);
    //miniquiches
    create(Product(
        id: 0,
        name: "Miniquiche de Camarão",
        amount: 0,
        price: 15,
        pathImage: AppImages.miniQuicheCamarao));
    create(Product(
        id: 0,
        name: "Miniquiche de Carne do Sol",
        amount: 0,
        price: 15,
        pathImage: AppImages.miniQuicheCarneSol));
    create(Product(
        id: 0,
        name: "Miniquiche de Frango",
        amount: 0,
        price: 15,
        pathImage: AppImages.miniQuicheCamarao));

    // quiches
    create(Product(
        id: 0,
        name: "Quiche de Carne do Sol Média",
        amount: 0,
        price: 35,
        pathImage: AppImages.quicheCarneSol));
    create(Product(
        id: 0,
        name: "Quiche de Carne do Sol Grande",
        amount: 0,
        price: 65,
        pathImage: AppImages.quicheCarneSol));

    create(Product(
        id: 0,
        name: "Quiche Caprese Média",
        amount: 0,
        price: 35,
        pathImage: AppImages.quicheCaprese));
    create(Product(
        id: 0,
        name: "Quiche Caprese Grande",
        amount: 0,
        price: 65,
        pathImage: AppImages.quicheCaprese));

    create(Product(
        id: 0,
        name: "Quiche de Camarão Média",
        amount: 0,
        price: 35,
        pathImage: AppImages.quicheCamarao));
    create(Product(
        id: 0,
        name: "Quiche de Camarão Grande",
        amount: 0,
        price: 65,
        pathImage: AppImages.quicheCamarao));

    // Tortas de Frango
    create(Product(
        id: 0,
        name: "Torta de Frango Média",
        amount: 0,
        price: 25,
        pathImage: AppImages.tortaFrango));
    create(Product(
        id: 0,
        name: "Torta de Frango Grande",
        amount: 0,
        price: 60,
        pathImage: AppImages.tortaFrango));

    print('Banco criado');
  }
}
