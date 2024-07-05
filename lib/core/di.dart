import 'package:andregarcia_kalshi/services/wellness_calculator/data/datasources/financial_health_datasource.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/data/datasources/financial_health_datasource_impl.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/data/repository/financial_health_repository_impl.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/repository/financial_health_repository.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/usecase/get_financial_health_use_case.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/bloc/financial_health_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<FinancialHealthDatasource>(
      FinancialHealthDatasourceImpl());
  getIt.registerLazySingleton<FinancialHealthRepository>(
      () => FinancialHealthRepositoryImpl(getIt()));

  getIt.registerLazySingleton(() => GetFinancialHealthUseCase(getIt()));

  getIt
      .registerFactory<FinancialHealthBloc>(() => FinancialHealthBloc(getIt()));
}
