import 'package:casa_brisee/Model/product.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardFormProduct extends StatefulWidget {
  Product product;
  TextEditingController controller;

  CardFormProduct({
    Key? key,
    required this.product,
    required this.controller,
  }) : super(key: key);

  @override
  _CardFormProductState createState() => _CardFormProductState();
}

class _CardFormProductState extends State<CardFormProduct> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      // OBS: ABSTRAIR E MODIFICAR ESSE CARD PARA WIDGET E COM CONTROLE
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product.name,
              style: TextStyles.titleListTile,
            ),
            SizedBox(
              width: size.width / 8,
              child: TextFormField(
                showCursor: false,
                style: TextStyles.buttonGray,
                textAlign: TextAlign.center,
                controller: widget.controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //focusColor: AppColors.primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                onChanged: (value) {
                  widget.product.amount = int.parse(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
