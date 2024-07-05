import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/usecase/get_financial_health_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'financial_health_event.dart';
part 'financial_health_state.dart';

class FinancialHealthBloc
    extends Bloc<FinancialHealthEvent, FinancialHealthState> {
  final GetFinancialHealthUseCase _getFinancialHealthUseCase;
  FinancialHealthBloc(this._getFinancialHealthUseCase)
      : super(FinancialHealthState()) {
    on<GetFinancialResult>(onGetFinancialResult);
  }

  void onGetFinancialResult(
      GetFinancialResult event, Emitter<FinancialHealthState> emit) {
    if (state is! FinancialHealthLoading) {
      emit(FinancialHealthLoading());
      final financialResult = _getFinancialHealthUseCase.handle(
          event.annualIncome, event.monthlyCosts);
      emit(FinancialHealthSuccess(financialHealth: financialResult));
    }
  }
}
