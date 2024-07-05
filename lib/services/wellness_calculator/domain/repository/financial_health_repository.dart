import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';

abstract class FinancialHealthRepository {
  FinancialHealth getFinancialHealth(double annualCosts, double monthlyIncome);
}
