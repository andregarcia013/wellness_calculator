import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_status.dart';

class FinancialHealthDTO {
  final FinancialStatus financialStatus;
  final double quota;
  const FinancialHealthDTO(
      {required this.financialStatus, required this.quota});

  toEntity() {
    return FinancialHealth(financialStatus: financialStatus, quota: quota);
  }
}
