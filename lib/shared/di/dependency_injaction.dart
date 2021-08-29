import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/cubit_log_and_reg.dart';
import 'package:e_commerce/shared/cubit/order/order_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';

import 'package:e_commerce/shared/network/local/cache_helper.dart';
import 'package:e_commerce/shared/network/remote/dio_helper.dart';
import 'package:e_commerce/shared/network/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.I..allowReassignment = true;
Future init() async {
  final shared = await SharedPreferences.getInstance();
//registerLazySingleton:activates when i need it

  di.registerLazySingleton<SharedPreferences>(
        () => shared,
  );
  di.registerLazySingleton<CacheHelper>(() => CacheImp(
    di<SharedPreferences>(),
  ));
  di.registerLazySingleton<DioHelper>(() => DioImplementation());
  di.registerLazySingleton<Repository>(() => RepoImplementation(
      dioHelper: di<DioHelper>(), cacheHelper: di<CacheHelper>()));
  di.registerLazySingleton<LoginCubit>(() => LoginCubit(
        di<Repository>(),
    di<DioHelper>()
      ));
  di.registerLazySingleton<OrderCubit>(() => OrderCubit(
    di<Repository>(),
  ));

  di.registerLazySingleton<SettingCubit>(() => SettingCubit(
    di<Repository>(),
  ));
  //registerFactory:active all time

  di.registerFactory<AppCubit>(() => AppCubit(di<Repository>(),di<DioHelper>()));
  // di.registerFactory<SettingCubit>(() => SettingCubit(
  //       di<Repository>(),
  //     ));
  di.registerFactory<ProductCubit>(() => ProductCubit(
    di<Repository>(),
  ));

}
