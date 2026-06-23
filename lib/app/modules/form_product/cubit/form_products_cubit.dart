import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormProductsCubit extends Cubit<FormProductsState> {
  FormProductsCubit() : super(FormProductsState.initial());

  void searchProduct(String barcode) {
    emit(state.copyWith(barcodeText: barcode));
  }
}
