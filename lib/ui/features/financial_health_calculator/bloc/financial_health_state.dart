part of "financial_health_bloc.dart";

class FinancialHealthState {}

class FinancialHealthLoading extends FinancialHealthState {}

class FinancialHealthSuccess extends FinancialHealthState {
  FinancialHealth financialHealth;

  FinancialHealthSuccess({required this.financialHealth});
}
