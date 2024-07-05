import 'package:andregarcia_kalshi/services/wellness_calculator/data/dto/financial_health_dto.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_status.dart';
import 'package:equatable/equatable.dart';

class FinancialHealth implements Equatable {
  final FinancialStatus financialStatus;
  final double quota;
  const FinancialHealth({required this.financialStatus, required this.quota});

  @override
  List<Object?> get props => [quota, financialStatus];

  @override
  bool? get stringify => false;

  factory FinancialHealth.fromDTO(FinancialHealthDTO financialHealthDTO) {
    return financialHealthDTO.toEntity();
  }
}
