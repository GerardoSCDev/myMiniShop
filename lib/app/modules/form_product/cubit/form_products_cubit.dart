import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_mini_shop/app/common/network/manager/network_result.dart';
import 'package:my_mini_shop/app/common/network/services/open_food_facs/open_food_facts_repository.dart';
import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_state.dart';

class FormProductsCubit extends Cubit<FormProductsState> {
  FormProductsCubit({
    required OpenFoodFactsRepository openFoodFactsRepository,
  }) : _openFoodFactsRepository = openFoodFactsRepository,
       super(FormProductsState.initial());

  final OpenFoodFactsRepository _openFoodFactsRepository;

  void searchProduct(String barcode) {
    emit(state.copyWith(barcodeText: barcode));
    _getProducts();
  }

  void productNameChanged(String text) {
    emit(state.copyWith(productName: text));
  }

  void categoryChanged(String text) {
    emit(state.copyWith(category: text));
  }

  void constPriceChanged(String text) {
    emit(state.copyWith(constPrice: text));
  }

  void salesPriceChanged(String text) {
    emit(state.copyWith(salesPrice: text));
  }

  void initStockChanged(String text) {
    emit(state.copyWith(initStock: int.parse(text)));
  }

  void lowStockChanged(String text) {
    emit(state.copyWith(lowStock: int.parse(text)));
  }

  void saveProduct() {
    debugPrint(state.toString());
  }

  Future<void> _getProducts() async {
    final barcode = state.barcodeText.trim();

    if (barcode.isEmpty) return;

    emit(state.copyWith(isLoadSearchProducts: true));

    final result = await _openFoodFactsRepository.getProductByBarcode(
      barcode: barcode,
    );

    switch (result) {
      case NetworkSuccess(data: final data):
        print(data.productName);
        emit(
          state.copyWith(
            isLoadSearchProducts: false,
            productName: data.productName,
          ),
        );
      case NetworkFailure():
        print('ERROR');
        emit(state.copyWith(isLoadSearchProducts: false));
    }
  }
}
