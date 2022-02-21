import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:casa_brisee/Model/product.dart';

class CardProduct extends StatelessWidget {
  final Product product;

  const CardProduct({Key? key, required Product this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(7),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                product.name,
                style: TextStyles.titleListTile,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Valor: R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyles.captionBody,
                ),
                Text(
                  'Quantidade: ${product.amount}',
                  style: TextStyles.buttonGray,
                ),
              ],
            ),
            trailing: Container(
              height: 48,
              width: 48,
              child: ClipRRect(
                child: Image.asset(product.pathImage),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
