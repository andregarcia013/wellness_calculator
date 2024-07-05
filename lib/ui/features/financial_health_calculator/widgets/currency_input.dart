import 'package:andregarcia_kalshi/core/extensions/sizer_extensions.dart';
import 'package:andregarcia_kalshi/core/extensions/widget_extension.dart';
import 'package:andregarcia_kalshi/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInput extends StatelessWidget {
  final String label;
  final String? error;
  final void Function(double value) onChange;

  const CurrencyInput({
    super.key,
    required this.label,
    required this.onChange,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          width: 256.0.w,
          child: TextField(
            onChanged: (value) => onChange(
                value.isNotEmpty ? double.parse(value.replaceAll(',', "")) : 0),
            style: Theme.of(context).textTheme.labelMedium,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter()
            ],
            decoration: InputDecoration(
                errorText: error,
                prefixIcon: Image.asset(AppAssetsImages.dollarSign)),
          ).paddingOnly(top: 8.0.w),
        )
      ],
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    var formatter = NumberFormat('###,###,###,###');
    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
