import 'dart:async';
import 'package:casa_brisee/Model/product.dart';
import 'package:casa_brisee/Model/store_database.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/widgets/appBar.dart';
import 'package:casa_brisee/shared/widgets/bottom_navigation_bar.dart';
import 'package:casa_brisee/shared/widgets/list_store.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightAppBar = size.height * 0.08;

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
        decoration: const BoxDecoration(
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
            future: Future.delayed(
                const Duration(milliseconds: 400), () => findAllProducts()),
            builder: (context, snapshot) {
              final List<Product> products = snapshot.data as List<Product>;
              return ListProduct(list: products);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.create_rounded),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/store_form');
        },
      ),
      bottomNavigationBar: BottomNavagationBar(
        page: 'store',
        heightAppBar: heightAppBar,
      ),
    );
  }
}
