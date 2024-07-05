import 'package:andregarcia_kalshi/services/wellness_calculator/data/datasources/financial_health_datasource.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/data/dto/financial_health_dto.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_status.dart';

class FinancialHealthDatasourceImpl implements FinancialHealthDatasource {
  @override
  FinancialHealthDTO getFinancialHealth(
    double annualIncome,
    double monthlyExpenses,
  ) {
    double annualExpenses = monthlyExpenses * 12;

    double annualNetCompensation = annualIncome * (1 - 0.08);

    double costRatio = annualExpenses / annualNetCompensation;

    FinancialStatus financialStatus;
    if (costRatio <= 0.25) {
      financialStatus = FinancialStatus.healthy;
    } else if (costRatio <= 0.75) {
      financialStatus = FinancialStatus.medium;
    } else {
      financialStatus = FinancialStatus.low;
    }

    double quota = (costRatio * 100);

    return FinancialHealthDTO(financialStatus: financialStatus, quota: quota);
  }
}
