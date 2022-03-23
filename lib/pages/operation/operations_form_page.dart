import 'package:casa_brisee/Model/operation.dart';
import 'package:casa_brisee/Model/operation_database.dart';
import 'package:casa_brisee/Model/product.dart';
import 'package:casa_brisee/Model/store_database.dart';
import 'package:casa_brisee/Model/wallet_database.dart';
import 'package:casa_brisee/shared/themes/app_colors.dart';
import 'package:casa_brisee/shared/themes/app_text_styles.dart';
import 'package:casa_brisee/shared/widgets/appBar.dart';
import 'package:casa_brisee/shared/widgets/buttons_cancel_confirm.dart';
import 'package:casa_brisee/shared/widgets/card_form_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OperationsFormPage extends StatefulWidget {
  const OperationsFormPage({Key? key}) : super(key: key);

  @override
  State<OperationsFormPage> createState() => _OperationsFormPageState();
}

class _OperationsFormPageState extends State<OperationsFormPage> {
  bool isSwitched = false;

  // COMPRA
  final _formCompra = GlobalKey<FormState>();
  final _valor = TextEditingController();
  final _description = TextEditingController();
  // VENDA
  final _formVenda = GlobalKey<FormState>();
  final _cliente = TextEditingController();

  newTransaction() {
    if (isSwitched == true) {
      if (_formCompra.currentState!.validate()) {
        // SAVE TRANSACTION
        save(Operation(
          id: 0,
          type: 1,
          description: "Descrição: ${_description.text}\n",
          value: double.parse(_valor.text),
        ));
        updateWallet(-double.parse(_valor.text));
        Navigator.pushReplacementNamed(context, '/operations');
      }
    } else {
      debugPrint("Entrei no else");
      bool emptyProducts() {
        String value = '';
        for (TextEditingController controller in controllersProduct) {
          value += controller.text;
        }
        return value == '' ? false : true;
      }

      if (_formVenda.currentState!.validate() && emptyProducts()) {
        double valor() {
          double valorTotal = 0;
          for (int i = 0; i < productsList.length; i++) {
            if (controllersProduct[i].text != '') {
              valorTotal += double.parse(controllersProduct[i].text) *
                  productsList[i].price;
            }
          }
          return valorTotal;
        }

        String description() {
          String description = "";
          for (int i = 0; i < productsList.length; i++) {
            if (controllersProduct[i].text != '') {
              description +=
                  "${productsList[i].name} - ${controllersProduct[i].text} uni.\n";
            }
          }
          return description;
        }

        // SAVE TRANSACTION
        debugPrint("TENTANDO SALVAR");
        save(Operation(
          id: 0,
          type: 0,
          description:
              "Cliente: ${_cliente.text} \nProdutos:\n${description()}",
          value: valor(),
        ));

        debugPrint("Updating");
        updateWallet(valor());
        for (int i = 0; i < productsList.length; i++) {
          if (controllersProduct[i].text != '') {
            updateProductAmountById(i + 1,
                productsList[i].amount - int.parse(controllersProduct[i].text));
          }
        }
        Navigator.pushReplacementNamed(context, '/operations');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Adicione pelo menos um produto.')));
      }
    }
  }

  @override
  List<Product> productsList = [];
  List<TextEditingController> controllersProduct = [];
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height),
        child: const AppBarCasaBrisee(title: 'Nova Transação'),
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
          padding:
              const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 0),
          child: Container(
            color: AppColors.shape,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, right: 12, left: 12, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isSwitched ? 'Compra' : 'Venda',
                              style: const TextStyle(
                                  color: AppColors.primary, fontSize: 20),
                            ),
                            Switch(
                              value: isSwitched,
                              activeColor: AppColors.primary,
                              onChanged: (bool value) {
                                if (value) {
                                  isSwitched = true;
                                } else {
                                  isSwitched = false;
                                }
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                      isSwitched
                          ? (Form(
                              key: _formCompra,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TextFormField(
                                      enabled: isSwitched,
                                      showCursor: false,
                                      controller: _description,
                                      style: TextStyles.buttonGray,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        //focusColor: AppColors.primary,
                                        labelText: 'Descrição',
                                        labelStyle:
                                            TextStyles.buttonBoldPrimary,
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Informe a descrição';
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TextFormField(
                                      enabled: isSwitched,
                                      showCursor: false,
                                      controller: _valor,
                                      style: TextStyles.buttonGray,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        //focusColor: AppColors.primary,
                                        labelText: 'Valor',
                                        labelStyle:
                                            TextStyles.buttonBoldPrimary,
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]|[.]|[-]')),
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Informe o valor da Compra';
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          : (Form(
                              key: _formVenda,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: TextFormField(
                                      enabled: !isSwitched,
                                      showCursor: false,
                                      controller: _cliente,
                                      style: TextStyles.buttonGray,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        //focusColor: AppColors.primary,
                                        labelText: 'Cliente',
                                        labelStyle:
                                            TextStyles.buttonBoldPrimary,
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Informe o cliente';
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.7 * 0.74,
                                    child: FutureBuilder<List<Product>>(
                                      initialData: const [],
                                      future: findAllProducts(),
                                      builder: (context, snapshot) {
                                        final List<Product> products =
                                            snapshot.data as List<Product>;
                                        //colocando a lista de productos no escopo de fora do future
                                        if (productsList.isEmpty) {
                                          for (int i = 0;
                                              i < products.length;
                                              i++) {
                                            productsList.add(products[i]);
                                            controllersProduct.add(
                                                TextEditingController(
                                                    text: ""));
                                          }
                                        }
                                        return ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: products.length,
                                            itemBuilder: (context, index) {
                                              final int i = index;
                                              final Product product =
                                                  products[i];
                                              final card = CardFormOperation(
                                                  controller:
                                                      controllersProduct[i],
                                                  product: product,
                                                  isSwitched: isSwitched);
                                              return card;
                                            });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonsCancelAndConfirm(
        contextPage: context,
        size: size,
        cancelOnPressed: () {
          Navigator.pushReplacementNamed(context, '/operations');
        },
        confirmOnPressed: newTransaction,
      ),
    );
  }
}
