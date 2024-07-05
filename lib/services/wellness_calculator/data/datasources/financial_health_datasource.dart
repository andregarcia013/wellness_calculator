import 'package:andregarcia_kalshi/services/wellness_calculator/data/dto/financial_health_dto.dart';

abstract class FinancialHealthDatasource {
  FinancialHealthDTO getFinancialHealth(
    double annualIncoming,
    double monthlyExpenses,
  );
}
