import 'package:andregarcia_kalshi/core/di.dart';
import 'package:andregarcia_kalshi/core/extensions/sizer_extensions.dart';
import 'package:andregarcia_kalshi/core/extensions/widget_extension.dart';
import 'package:andregarcia_kalshi/core/utils/colors.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_status.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/bloc/financial_health_bloc.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/widgets/wellness_score_bar.dart';
import 'package:andregarcia_kalshi/ui/widgets/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResultPage extends StatelessWidget {
  final FinancialHealth financialHealth;
  const ResultPage(
    this.financialHealth, {
    super.key,
  });

  String _getDescriptionText() {
    switch (financialHealth.financialStatus) {
      case FinancialStatus.healthy:
        return "Congratulations!";
      case FinancialStatus.medium:
        return "There is room for improvement.";
      case FinancialStatus.low:
        return "Caution!";
    }
  }

  String _getFinancialStatus() {
    switch (financialHealth.financialStatus) {
      case FinancialStatus.healthy:
        return "Healthy";
      case FinancialStatus.medium:
        return "Average";
      case FinancialStatus.low:
        return "Unhealthy";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<FinancialHealthBloc>(),
        child: BlocBuilder<FinancialHealthBloc, FinancialHealthState>(
          builder: (context, state) {
            return BaseLayout(
              color: backgroundGrey,
              title: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Here's your ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 18.0.w),
                      children: [
                        TextSpan(
                          text: "financial wellness score.",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0.w),
                        )
                      ])),
              contents: [
                WellnessScoreBar(financialHealth),
                SizedBox(
                  width: 256.0.w,
                  child: Text(
                    _getDescriptionText(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18.0.w),
                  ),
                ),
                Text(
                  "Your financial wellness score is",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14.0.w),
                ),
                Text(
                  "${_getFinancialStatus()}.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14.0.w, fontWeight: FontWeight.bold),
                ).paddingOnly(bottom: 16.0.h),
                SizedBox(
                  width: 256.0.w,
                  height: 56.0.h,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          side: MaterialStateProperty.all(const BorderSide(
                              color: blueColor,
                              width: 2.0,
                              style: BorderStyle.solid))),
                      onPressed: () => {context.go('/home')},
                      child: Text(
                        'Return',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: blueColor,
                            fontSize: 16.0.h,
                            fontWeight: FontWeight.bold),
                      )),
                ).paddingOnly(top: 16),
                const SizedBox(
                  height: 30,
                )
              ],
            );
          },
        ));
  }
}
