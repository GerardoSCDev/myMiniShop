import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_scaffold/app_scaffold.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_barcode_field.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_details_card.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_image_uploader.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_save_button.dart';
import 'package:my_mini_shop/app/modules/form_product/view/widgets/form_product_stock_notifications_card.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class FormProductScreen extends StatelessWidget {
  FormProductScreen({super.key});

  final ValueNotifier<XFile?> _selectedImage = ValueNotifier<XFile?>(null);
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _costPriceController = TextEditingController();
  final TextEditingController _salesPriceController = TextEditingController();
  final TextEditingController _initStockController = TextEditingController();
  final TextEditingController _lowStockController = TextEditingController();

  Future<void> _scanBarcode(BuildContext context) async {
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

    if (!context.mounted ||
        barcode == null ||
        barcode.isEmpty ||
        barcode == '-1') {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleAppBar: FormProductCopies.title,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: AppSize.lgPadding),
              child: Column(
                children: [
                  formProductBarcodeField(
                    context: context,
                    controller: _barcodeController,
                    onScanPressed: () => _scanBarcode(context),
                  ),
                  SizedBox(height: AppSize.lgPadding),
                  ValueListenableBuilder<XFile?>(
                    valueListenable: _selectedImage,
                    builder: (context, selectedImage, _) {
                      return formProductImageUploader(
                        selectedImage: selectedImage,
                        onImageSelected: (image) {
                          _selectedImage.value = image;
                        },
                      );
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
                  ),
                  SizedBox(height: AppSize.lgPadding),
                  formProductStockNotificationsCard(),
                ],
              ),
            ),
          ),
          formProductSaveButton(onPressed: () {}),
        ],
      ),
    );
  }
}
