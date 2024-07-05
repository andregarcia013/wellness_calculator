import 'package:andregarcia_kalshi/core/di.dart';
import 'package:andregarcia_kalshi/core/extensions/sizer_extensions.dart';
import 'package:andregarcia_kalshi/core/extensions/widget_extension.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/bloc/financial_health_bloc.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/model/home_page_model.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/widgets/currency_input.dart';
import 'package:andregarcia_kalshi/ui/widgets/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final HomePageModel model = HomePageModel(0, 0);
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FinancialHealthBloc>(),
      child: BaseLayout(
        title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Let's find out your ",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 18.0.w),
                children: [
                  TextSpan(
                    text: "financial wellness score.",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18.0.w),
                  )
                ])),
        contents: [
          Text(
            "Financial wellness test",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 18.0.w),
          ),
          Text(
            "Enter your financial information below",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 14.0.w),
          ).paddingOnly(bottom: 16.0.h),
          StatefulBuilder(builder: (context, setState) {
            print(model.annualIncome);
            return Column(
              children: [
                CurrencyInput(
                    label: 'Annual income',
                    error: model.error == true && model.annualIncome <= 0
                        ? "Annual income needs to be more than zero"
                        : null,
                    onChange: (value) {
                      if (value > 0) {
                        model.error = false;
                        setState(() {});
                      }
                      model.annualIncome = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                CurrencyInput(
                    label: 'Monthly Costs',
                    error: model.error == true && model.monthlyCosts <= 0
                        ? "Montlhy costs needs to be more than zero"
                        : null,
                    onChange: (value) {
                      if (value > 0) {
                        model.error = false;
                        setState(() {});
                      }
                      model.monthlyCosts = value;
                    }),
                BlocConsumer<FinancialHealthBloc, FinancialHealthState>(
                    builder: (context, state) {
                  return SizedBox(
                    width: 256.0.w,
                    height: 56.0.h,
                    child: TextButton(
                        onPressed: () {
                          if (model.annualIncome > 0 &&
                              model.monthlyCosts > 0) {
                            context
                                .read<FinancialHealthBloc>()
                                .add(GetFinancialResult(
                                  annualIncome: model.annualIncome,
                                  monthlyCosts: model.monthlyCosts,
                                ));
                            context.go('/result');
                          } else {
                            model.error = true;
                            setState(() {});
                          }
                        },
                        child: Text(
                          'Continue',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white, fontSize: 16.0.h),
                        )),
                  ).paddingOnly(top: 16);
                }, listener: (context, state) {
                  if (state is FinancialHealthSuccess) {
                    context.go('/result', extra: state.financialHealth);
                  }
                })
              ],
            );
          }),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
