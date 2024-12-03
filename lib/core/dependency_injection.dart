import 'package:get_it/get_it.dart';

import '../features/orders_overview/presentation/manager/orders_cubit.dart';



final di = GetIt.instance;

/// Initializes the application module, including dependency injection.
Future<void> dependencyInjection() async {

  ///Cubit instance .
  di.registerLazySingleton<OrdersCubit>(()=>OrdersCubit());



}