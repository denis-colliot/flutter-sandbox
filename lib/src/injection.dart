import 'package:dio/dio.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_usecase.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/viewmodel/beers_viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'features/beers/data/datasource/punk_api.dart';
import 'features/beers/data/repository/beers_repository_impl.dart';
import 'features/beers/domain/repository/beers_repository.dart';

final injector = GetIt.instance;

Future<void> initDependencyInjection() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Beers feature
  injector.registerFactory<PunkApi>(() => PunkApi(injector()));
  injector.registerFactory<IsBeersRepository>(
      () => BeersRepositoryImpl(injector()));
  injector.registerFactory<GetBeersUseCase>(() => GetBeersUseCase(injector()));
  injector.registerFactory<BeersViewModel>(() => BeersViewModel(injector()));
}
