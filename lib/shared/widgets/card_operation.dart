import 'package:casa_brisee/Model/operation.dart';
import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardOperation extends StatelessWidget {
  final Operation operation;
  //final date;
  //final description;
  //final valueBare;
  //final type;
  const CardOperation({
    Key? key,
    required this.operation,
    //required String this.date,
    //required String this.description,
    //required num this.valueBare,
    //required bool this.type
  }) : super(key: key);
  get value => operation.value.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              operation.type == 1
                  ? Text("Compra", style: TextStyles.captionBoldBody)
                  : Text("Venda", style: TextStyles.captionBoldBody),
              Text('Data:${operation.today}', style: TextStyles.captionBody),
              Text(operation.description, style: TextStyles.captionBody),
              //const SizedBox(height: 12),
              Text('Valor: R\$: $value', style: TextStyles.captionBoldBody),
            ],
          ),
        ),
      ),
    );
  }
}
