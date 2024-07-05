import 'package:andregarcia_kalshi/core/extensions/sizer_extensions.dart';
import 'package:andregarcia_kalshi/core/utils/colors.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_status.dart';
import 'package:flutter/material.dart';

class WellnessScoreBar extends StatelessWidget {
  final FinancialHealth _financialHealth;
  const WellnessScoreBar(this._financialHealth, {super.key});

  Color _getBarColor(int index) {
    switch (index) {
      case 1:
        switch (_financialHealth.financialStatus) {
          case FinancialStatus.healthy:
            return greenColor;
          case FinancialStatus.medium:
            return yellowColor;
          case FinancialStatus.low:
            return redColor;
        }
      case 2:
        switch (_financialHealth.financialStatus) {
          case FinancialStatus.healthy:
            return greenColor;
          case FinancialStatus.medium:
            return yellowColor;
          case FinancialStatus.low:
            return defaultGrey;
        }

      case 3:
        switch (_financialHealth.financialStatus) {
          case FinancialStatus.healthy:
            return greenColor;
          case FinancialStatus.medium:
            return defaultGrey;
          case FinancialStatus.low:
            return defaultGrey;
        }
      default:
        return defaultGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256.0.w,
      height: 30.0.h,
      child: Stack(
        children: [
          Positioned(
              left: 160.0.w,
              child: Container(
                  width: 91.0.w,
                  height: 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.white,
                          width: 3,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      color: _getBarColor(3)))),
          Positioned(
            left: 85.0.w,
            child: Container(
                width: 91.0.w,
                height: 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.white,
                        width: 3,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    color: _getBarColor(2))),
          ),
          Positioned(
              left: 10.0.w,
              child: Container(
                  width: 86.0.w,
                  height: 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.white,
                          width: 3,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      color: _getBarColor(1)))),
        ],
      ),
    );
  }
}
