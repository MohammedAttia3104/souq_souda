import 'package:get_it/get_it.dart';
import 'package:souq_souda/currency/data/data_sources/remote_currency_data_source.dart';
import 'package:souq_souda/currency/data/repositories/currency_repository.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_repository.dart';
import 'package:souq_souda/currency/domain/use_cases/get_banks_use_case.dart';
import 'package:souq_souda/currency/domain/use_cases/get_currency_details_use_case.dart';
import 'package:souq_souda/currency/presentation/controllers/currency_details_cubit.dart';
import 'package:souq_souda/gold/data/data_sources/gold_remote_data_source.dart';
import 'package:souq_souda/gold/data/repositories/gold_repository.dart';
import 'package:souq_souda/gold/domain/repositories/base_gold_repository.dart';
import 'package:souq_souda/gold/domain/use_cases/get_gold_use_case.dart';
import 'package:souq_souda/gold/presentation/controllers/gold_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///TODO:Currency & Banks
    //Bloc
    sl.registerFactory<CurrencyDetailsCubit>(
        () => CurrencyDetailsCubit(sl(), sl()));
    //UseCase
    sl.registerLazySingleton(() => GetCurrencyDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetBanksUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseCurrencyRepository>(
        () => CurrencyRepository(sl()));
    //DataSource
    sl.registerLazySingleton<BaseCurrencyRemoteDataSource>(
        () => CurrencyRemoteDataSource());

    ///ToDo:Gold
    //Bloc
    sl.registerFactory<GoldCubit>(() => GoldCubit(sl()));
    //UseCase
    sl.registerLazySingleton(() => GetGoldUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseGoldRepository>(() => GoldRepository(sl()));
    //DataSource
    sl.registerLazySingleton<BaseGoldRemoteDataSource>(
        () => GoldRemoteDataSource());
  }
}
