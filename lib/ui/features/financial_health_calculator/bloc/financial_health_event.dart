part of "financial_health_bloc.dart";

class FinancialHealthEvent {
  const FinancialHealthEvent();
}

class GetFinancialResult implements FinancialHealthEvent {
  double annualIncome;
  double monthlyCosts;

  GetFinancialResult({required this.annualIncome, required this.monthlyCosts});
}
