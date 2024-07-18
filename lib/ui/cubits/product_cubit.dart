import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/ui/cubits/product_state.dart';

import '../../data/model/product_model.dart';
import '../../data/repository/product_repository.dart';
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository) : super(ProductInitial());
  final ProductRepository productRepository;


  List<ProductModel> products =[] ;
  List<ProductModel>? search ;

  void getAllProduct() async {
    emit(GetAllProductLoadingState());

    final res = await productRepository.getProducts();
    res.fold(
          (l) => emit(GetAllProductErrorState()),
          (r) {
            products = r.products ;
            search = products;
        emit(GetAllProductSuccessState());

      },
    );
  }

  void searchProduct(String? searchTerm) {
    if (products.isNotEmpty) {
      if (searchTerm!.isEmpty) {
        search = products;
      } else {
        search = products
            .where((title) =>
            title.title.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
      }
      emit(SearchResultsState());
    }
  }



}
