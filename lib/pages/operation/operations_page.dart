import 'dart:async';

import 'package:casa_brisee/Model/operation_database.dart';
import 'package:casa_brisee/Model/operation.dart';
import 'package:casa_brisee/Model/start_database.dart';
import 'package:casa_brisee/Model/store_database.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/widgets/appBar.dart';
import 'package:casa_brisee/shared/widgets/bottom_navigation_bar.dart';
import 'package:casa_brisee/shared/widgets/list_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OperationsPage extends StatefulWidget {
  const OperationsPage({Key? key}) : super(key: key);

  @override
  State<OperationsPage> createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  @override
  //ATUALIZE PAGE ALWAYS
  void initState() {
    Timer(const Duration(milliseconds: 100), () => setState(() {}));
    super.initState();
  }

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );

    fixNumberOfOperations() async {
      await keepNumberOfOperationsFixed(20);
    }

    fixNumberOfOperations();

    final size = MediaQuery.of(context).size;

    final heightAppBar = size.height * 0.08;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height),
        child: const AppBarCasaBrisee(
          title: 'Transações',
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
          child: FutureBuilder<List<Operation>>(
            initialData: const [],
            future: findAllOperations(),
            builder: (context, snapshot) {
              final List<Operation> operations =
                  snapshot.data as List<Operation>;
              return ListOperation(list: operations);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
        onPressed: () {
          debugPrint('Cliquei +');
          Navigator.pushReplacementNamed(context, '/operations_form');
        },
      ),
      bottomNavigationBar:
          BottomNavagationBar(page: 'operation', heightAppBar: heightAppBar),
    );
  }
}
