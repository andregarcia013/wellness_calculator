import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/repository/financial_health_repository.dart';

class GetFinancialHealthUseCase {
  final FinancialHealthRepository _financialHealthRepository;

  GetFinancialHealthUseCase(this._financialHealthRepository);

  FinancialHealth handle(double annualIncome, double monthlyCosts) {
    return _financialHealthRepository.getFinancialHealth(
        annualIncome, monthlyCosts);
  }
}
