import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route/ui/cubits/product_cubit.dart';
import 'package:route/ui/util/cache_helper.dart';
import 'data/api/api_consumer.dart';
import 'data/api/dio_consumer.dart';
import 'data/repository/product_repository.dart';

final sl = GetIt.instance;


void initServiceLocator(){
  //cubits

   sl.registerLazySingleton(()=>ProductCubit(sl()));

  //product feature
   sl.registerLazySingleton(() => ProductRepository());
  //external
  sl.registerLazySingleton(()=>CacheHelper());

  sl.registerLazySingleton<ApiConsumer>(()=>DioConsumer(sl()));
  sl.registerLazySingleton(()=>Dio());


}