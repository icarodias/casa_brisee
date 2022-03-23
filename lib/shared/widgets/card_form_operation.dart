import 'package:casa_brisee/Model/product.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardFormOperation extends StatefulWidget {
  final TextEditingController controller;
  final bool isSwitched;
  final Product product;
  const CardFormOperation(
      {Key? key,
      required this.product,
      required this.controller,
      required this.isSwitched})
      : super(key: key);

  @override
  _CardFormOperationState createState() => _CardFormOperationState();
}

class _CardFormOperationState extends State<CardFormOperation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.product.name, style: TextStyles.buttonBoldPrimary),
          SizedBox(
            width: size.width / 7,
            child: TextFormField(
              textAlign: TextAlign.center,
              enabled: !widget.isSwitched,
              showCursor: false,
              controller: widget.controller,
              style: TextStyles.buttonGray,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
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
            ),
          ),
        ],
      ),
    );
  }
}
