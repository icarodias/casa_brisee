import 'package:casa_brisee/Model/product.dart';
import 'package:casa_brisee/Model/store_database.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/widgets/appBar.dart';
import 'package:casa_brisee/shared/widgets/buttons_cancel_confirm.dart';
import 'package:casa_brisee/shared/widgets/card_form_product.dart';
import 'package:flutter/material.dart';

class StoreFormPage extends StatefulWidget {
  const StoreFormPage({Key? key}) : super(key: key);
  @override
  State<StoreFormPage> createState() => _StoreFormPageState();
}

class _StoreFormPageState extends State<StoreFormPage> {
  @override
  List<Product> productsList = [];
  List<TextEditingController> controllersAmount = [];
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height),
        child: const AppBarCasaBrisee(
          title: 'Estoque',
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        //color: AppColors.secondary,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.stroke, AppColors.shape],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder<List<Product>>(
            initialData: const [],
            future: findAllProducts(),
            builder: (context, snapshot) {
              final List<Product> products = snapshot.data as List<Product>;
              // colocando lista e controller para fora do escopo future

              if (productsList.length == 0) {
                for (int i = 0; i < products.length; i++) {
                  productsList.add(products[i]);
                  controllersAmount.add(
                      TextEditingController(text: "${products[i].amount}"));
                }
              }
              return ListView.builder(
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    final int i = index;
                    final Product product = productsList[i];
                    final card = CardFormProduct(
                        controller: controllersAmount[i], product: product);
                    return card;
                  });
            },
          ),
        ),
      ),
      bottomNavigationBar: ButtonsCancelAndConfirm(
        contextPage: context,
        size: size,
        cancelOnPressed: () {
          Navigator.pushReplacementNamed(context, '/store');
        },
        confirmOnPressed: () {
          debugPrint('controller - ${controllersAmount.length}');
          debugPrint('productList - ${productsList.length}');
          for (int i = 0; i < productsList.length; i++) {
            updateProductAmountById(
                i + 1, int.parse(controllersAmount[i].text));
          }
          Navigator.pushReplacementNamed(context, '/store');
        },
      ),
    );
  }
}
