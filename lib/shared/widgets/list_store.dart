import 'package:casa_brisee/Model/product.dart';
import 'package:casa_brisee/shared/widgets/card_product.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  List<Product> list;

  ListProduct({Key? key, required this.list}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        final int i = index;
        final Product product = widget.list[i];
        final card = CardProduct(product: product);
        return card;
      },
    );
  }
}
