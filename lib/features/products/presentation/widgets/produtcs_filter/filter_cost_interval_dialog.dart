import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../../../core/presentation/widgets/other/casual_dialog.dart';
import '../../../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../../../core/styles/styles.dart';
import '../../../../../../core/utils/size_config.dart';

class FilterCostIntervalDialog extends StatefulWidget {
  final void Function(String minCost, String maxCost) onTap;
  final double? minCost;
  final double? maxCost;
  const FilterCostIntervalDialog({
    super.key,
    required this.onTap,
    required this.minCost,
    required this.maxCost,
  });

  @override
  State<FilterCostIntervalDialog> createState() => _CostIntervalDialogState();
}

class _CostIntervalDialogState extends State<FilterCostIntervalDialog> {
  late final TextEditingController _minCostController = TextEditingController(
    text: widget.minCost?.toStringAsFixed(0),
  );
  late final TextEditingController _maxCostController = TextEditingController(
    text: widget.maxCost?.toStringAsFixed(0),
  );
  @override
  Widget build(BuildContext context) {
    return CasualDialog(
      title: 'Cost interval',
      subtitle: 'Enter cost interval manually',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CasualTextField(
            controller: _minCostController,
            keyboardType: TextInputType.number,
            maxLength: 5,
            counterText: '',
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
            hintText: 'Min cost',
            label: 'Min',
            labelStyle: kRegular.copyWith(
              color: kDarkBlue,
              fontSize: SizeConfig.body2,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          CasualTextField(
            controller: _maxCostController,
            keyboardType: TextInputType.number,
            maxLength: 5,
            counterText: '',
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
            hintText: 'Max cost',
            label: 'Max',
            labelStyle: kRegular.copyWith(
              color: kDarkBlue,
              fontSize: SizeConfig.body2,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CasualButton(
            onTap: () =>
                widget.onTap(_minCostController.text, _maxCostController.text),
            text: 'Enter',
            fontSize: SizeConfig.body2,
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
