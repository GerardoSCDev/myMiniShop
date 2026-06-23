import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormProductsCubit extends Cubit<FormProductsState> {
  FormProductsCubit() : super(FormProductsState.initial());

  void searchProduct(String barcode) {
    emit(state.copyWith(barcodeText: barcode));
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
    print(state);
  }
}
