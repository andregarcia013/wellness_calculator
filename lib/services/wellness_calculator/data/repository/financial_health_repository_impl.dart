import 'package:andregarcia_kalshi/services/wellness_calculator/data/datasources/financial_health_datasource.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/repository/financial_health_repository.dart';

class FinancialHealthRepositoryImpl implements FinancialHealthRepository {
  final FinancialHealthDatasource _financialHealthDatasource;

  FinancialHealthRepositoryImpl(this._financialHealthDatasource);

  @override
  FinancialHealth getFinancialHealth(double annualIncome, double monthlyCosts) {
    return _financialHealthDatasource
        .getFinancialHealth(annualIncome, monthlyCosts)
        .toEntity();
  }
}
