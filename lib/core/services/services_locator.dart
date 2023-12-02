import 'package:get_it/get_it.dart';
import 'package:souq_souda/Registeration/data/data_sources/auth_remote_data_source.dart';
import 'package:souq_souda/Registeration/data/repositories/auth_repository.dart';
import 'package:souq_souda/Registeration/domain/repositories/base_auth_repository.dart';
import 'package:souq_souda/Registeration/domain/use_cases/login_use_case.dart';
import 'package:souq_souda/Registeration/domain/use_cases/sign_up_use_case.dart';
import 'package:souq_souda/Registeration/presentation/controllers/auth_cubit.dart';
import 'package:souq_souda/currency/data/data_sources/remote_bank_data_source.dart';
import 'package:souq_souda/currency/data/data_sources/remote_currency_data_source.dart';
import 'package:souq_souda/currency/data/repositories/bank_repository.dart';
import 'package:souq_souda/currency/data/repositories/currency_repository.dart';
import 'package:souq_souda/currency/domain/repositories/base_bank_repository.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_repository.dart';
import 'package:souq_souda/currency/domain/use_cases/get_banks_use_case.dart';
import 'package:souq_souda/currency/domain/use_cases/get_currency_details_use_case.dart';
import 'package:souq_souda/currency/presentation/controllers/bank/bank_cubit.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';
import 'package:souq_souda/gold/data/data_sources/company_remote_data_source.dart';
import 'package:souq_souda/gold/data/data_sources/gold_remote_data_source.dart';
import 'package:souq_souda/gold/data/data_sources/ingots_and_coins_remote_data_source.dart';
import 'package:souq_souda/gold/data/repositories/company_repository.dart';
import 'package:souq_souda/gold/data/repositories/gold_repository.dart';
import 'package:souq_souda/gold/data/repositories/ingots_and_coins_repository.dart';
import 'package:souq_souda/gold/domain/repositories/base_company_repository.dart';
import 'package:souq_souda/gold/domain/repositories/base_gold_repository.dart';
import 'package:souq_souda/gold/domain/repositories/base_ingots_and_coins_repository.dart';
import 'package:souq_souda/gold/domain/use_cases/get_companies_use_case.dart';
import 'package:souq_souda/gold/domain/use_cases/get_gold_use_case.dart';
import 'package:souq_souda/gold/domain/use_cases/get_ingots_and_coins_use_case.dart';
import 'package:souq_souda/gold/presentation/controllers/company/company_cubit.dart';
import 'package:souq_souda/gold/presentation/controllers/gold/gold_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///TODO:Currency
    //Bloc
    sl.registerFactory<CurrencyDetailsCubit>(() => CurrencyDetailsCubit(sl()));
    //UseCase
    sl.registerLazySingleton(() => GetCurrencyDetailsUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseCurrencyRepository>(
        () => CurrencyRepository(sl()));
    //DataSource
    sl.registerLazySingleton<BaseCurrencyRemoteDataSource>(
        () => CurrencyRemoteDataSource());

    ///ToDo : Banks
    //Bloc
    sl.registerFactory<BankCubit>(() => BankCubit(sl()));
    //UseCase
    sl.registerLazySingleton(() => GetBanksUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseBankRepository>(() => BankRepository(sl()));
    //DataSource
    sl.registerLazySingleton<BaseBankRemoteDataSource>(
        () => BankRemoteDataSource());

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

    ///ToDo: Company
    /////Bloc
    sl.registerFactory<CompanyCubit>(() => CompanyCubit(sl()));
    //UseCase
    sl.registerLazySingleton(() => GetCompaniesUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseCompanyRepository>(
      () => CompanyRepository(sl()),
    );
    //DataSource
    sl.registerLazySingleton<BaseCompanyRemoteDataSource>(
      () => CompanyRemoteDataSource(),
    );

    ///ToDo: Ingots and Coins
    /////Bloc
    //UseCase
    sl.registerLazySingleton(() => GetIngotsAndCoinsUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseIngotsAndCoinsRepository>(
      () => IngotsAndCoinsRepository(sl()),
    );
    //DataSource
    sl.registerLazySingleton<BaseIngotsAndCoinsRemoteDataSource>(
      () => IngotsAndCoinsRemoteDataSource(),
    );

    ///ToDo:Registeration
    //Bloc
    sl.registerFactory<AuthCubit>(() => AuthCubit(sl(), sl()));
    //UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    //DataSource
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}
