import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_scaffold/app_scaffold.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';
import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_cubit.dart';
import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_state.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_barcode_field.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_details_card.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_image_uploader.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_save_button.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_stock_notifications_card.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class FormProductScreen extends StatefulWidget {
  const FormProductScreen({super.key});

  @override
  State<FormProductScreen> createState() => _FormProductScreenState();
}

class _FormProductScreenState extends State<FormProductScreen> {
  XFile? _selectedImage;
  late final TextEditingController _barcodeController;
  late final TextEditingController _productNameController;
  late final TextEditingController _categoryController;
  late final TextEditingController _costPriceController;
  late final TextEditingController _salesPriceController;
  late final TextEditingController _initStockController;
  late final TextEditingController _lowStockController;

  @override
  void initState() {
    super.initState();
    final state = context.read<FormProductsCubit>().state;
    _barcodeController = TextEditingController(
      text: state.barcodeText,
    );
    _productNameController = TextEditingController(text: state.productName);
    _categoryController = TextEditingController(text: state.category);
    _costPriceController = TextEditingController(text: state.constPrice);
    _salesPriceController = TextEditingController(text: state.salesPrice);
    _initStockController = TextEditingController(
      text: state.initStock.toString(),
    );
    _lowStockController = TextEditingController(
      text: state.lowStock.toString(),
    );
  }

  @override
  void dispose() {
    _barcodeController.dispose();
    _productNameController.dispose();
    _categoryController.dispose();
    _costPriceController.dispose();
    _salesPriceController.dispose();
    _initStockController.dispose();
    _lowStockController.dispose();
    super.dispose();
  }

  Future<void> _scanBarcode() async {
    final barcode = await SimpleBarcodeScanner.scanBarcode(
      context,
      barcodeAppBar: const BarcodeAppBar(
        appBarTitle: 'Escaner',
        centerTitle: false,
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),
      isShowFlashIcon: true,
      delayMillis: 2000,
    );

    if (!mounted || barcode == null || barcode.isEmpty || barcode == '-1') {
      return;
    }

    context.read<FormProductsCubit>().searchProduct(barcode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FormProductsCubit>();
    return BlocListener<FormProductsCubit, FormProductsState>(
      listenWhen: (previous, current) =>
          previous.barcodeText != current.barcodeText ||
          previous.productName != current.productName,
      listener: (context, state) {
        if (_barcodeController.text != state.barcodeText) {
          _barcodeController.text = state.barcodeText;
        }

        if (_productNameController.text != state.productName) {
          _productNameController.text = state.productName;
        }
      },
      child: AppScaffold(
        titleAppBar: FormProductCopies.title,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: AppSize.lgPadding),
                child: Column(
                  children: [
                    formProductBarcodeField(
                      controller: _barcodeController,
                      onScanPressed: _scanBarcode,
                    ),
                    SizedBox(height: AppSize.lgPadding),
                    formProductImageUploader(
                      selectedImage: _selectedImage,
                      onImageSelected: (image) {
                        setState(() {
                          _selectedImage = image;
                        });
                      },
                    ),
                    SizedBox(height: AppSize.lgPadding),
                    formProductDetailsCard(
                      productNameController: _productNameController,
                      categoryController: _categoryController,
                      costPriceController: _costPriceController,
                      salesPriceController: _salesPriceController,
                      initStockController: _initStockController,
                      lowStockController: _lowStockController,
                      cubit: cubit,
                    ),
                    SizedBox(height: AppSize.lgPadding),
                    formProductStockNotificationsCard(),
                  ],
                ),
              ),
            ),
            formProductSaveButton(onPressed: cubit.saveProduct),
          ],
        ),
      ),
    );
  }
}
