import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_button/app_button.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_card_container/app_card_container.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_image_uploader/app_image_uploader.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_scaffold/app_scaffold.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text_field/app_text_field.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';
import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_cubit.dart';
import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_state.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class FormProductScreen extends StatefulWidget {
  const FormProductScreen({super.key});

  @override
  State<FormProductScreen> createState() => _FormProductScreenState();
}

class _FormProductScreenState extends State<FormProductScreen> {
  XFile? _selectedImage;
  late final TextEditingController _barcodeController;

  @override
  void initState() {
    super.initState();
    _barcodeController = TextEditingController(
      text: context.read<FormProductsCubit>().state.barcodeText,
    );
  }

  @override
  void dispose() {
    _barcodeController.dispose();
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
    return BlocListener<FormProductsCubit, FormProductsState>(
      listenWhen: (previous, current) =>
          previous.barcodeText != current.barcodeText,
      listener: (context, state) {
        _barcodeController.text = state.barcodeText;
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
                    AppCardContainer(
                      child: Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              controller: _barcodeController,
                              label: FormProductCopies.barcodeLabel,
                              hint: FormProductCopies.barcodeHint,
                              suffixButtonIcon: Icons.barcode_reader,
                              onSuffixButtonPressed: _scanBarcode,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.lgPadding),
                    AppImageUploader(
                      title: FormProductCopies.productImageLabel,
                      image: _selectedImage == null
                          ? null
                          : FileImage(File(_selectedImage!.path)),
                      onImageSelected: (image) {
                        setState(() {
                          _selectedImage = image;
                        });
                      },
                    ),
                    SizedBox(height: AppSize.lgPadding),
                    AppCardContainer(
                      child: Column(
                        spacing: AppSize.smPadding,
                        children: [
                          AppTextField(
                            label: FormProductCopies.productNameLabel,
                            hint: FormProductCopies.productNameHint,
                          ),
                          AppTextField(
                            label: FormProductCopies.categoryLabel,
                            hint: FormProductCopies.categoryHint,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: AppTextField(
                                  label: FormProductCopies.costPriceLabel,
                                  hint: FormProductCopies.priceHint,
                                ),
                              ),
                              SizedBox(
                                width: AppSize.smPadding,
                              ),
                              Expanded(
                                child: AppTextField(
                                  label: FormProductCopies.salePriceLabel,
                                  hint: FormProductCopies.priceHint,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: AppTextField(
                                  label: FormProductCopies.initialStockLabel,
                                  hint: FormProductCopies.initialStockHint,
                                ),
                              ),
                              SizedBox(
                                width: AppSize.smPadding,
                              ),
                              Expanded(
                                child: AppTextField(
                                  label: FormProductCopies.lowStockAlertLabel,
                                  hint: FormProductCopies.lowStockAlertHint,
                                  suffixButtonIcon: Icons.info_outline_rounded,
                                  onSuffixButtonPressed: () {
                                    // acción del botón
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.lgPadding),
                    AppCardContainer(
                      backgroundColor: AppColors.bgAppCardContainer,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                AppText(
                                  text:
                                      FormProductCopies.stockNotificationsTitle,
                                  fontWeight: TextWeight.semiBold,
                                ),
                                AppText(
                                  text: FormProductCopies
                                      .stockNotificationsDescription,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.xlPadding),
              child: AppButton(text: FormProductCopies.saveButton),
            ),
          ],
        ),
      ),
    );
  }
}
