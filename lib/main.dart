import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/service_locator.dart';
import 'package:route/ui/cubits/product_cubit.dart';
import 'package:route/ui/util/app_routes.dart';
import 'package:route/ui/util/app_theme.dart';
import 'package:route/ui/util/cache_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(BlocProvider(
    create: (context) => sl<ProductCubit>()..getAllProduct(),
    child:  const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        initialRoute: Routes.intitlRoute,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
