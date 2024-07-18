import 'package:dartz/dartz.dart';

import '../../error/exceptions.dart';
import '../../service_locator.dart';
import '../api/api_consumer.dart';
import '../api/end_points.dart';
import '../model/product_model.dart';

class ProductRepository {

  //get products
  Future<Either<String, GetAllProductsModel>> getProducts() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.products,
      );
      return Right(GetAllProductsModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

}