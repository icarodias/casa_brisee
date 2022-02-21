import 'package:casa_brisee/Model/operation.dart';
import 'package:casa_brisee/shared/widgets/card_operation.dart';
import 'package:flutter/material.dart';

class ListOperation extends StatefulWidget {
  List<Operation> list;

  ListOperation({Key? key, required this.list}) : super(key: key);

  @override
  _ListOperationState createState() => _ListOperationState();
}

class _ListOperationState extends State<ListOperation> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        final i = widget.list.length - 1 - index;
        final operation = widget.list[i];
        final card = CardOperation(operation: operation);
        return card;
      },
    );
  }
}
