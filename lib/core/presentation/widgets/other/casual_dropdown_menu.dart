import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualDropdownMenu<T> extends StatelessWidget {
  final T currValue;
  final List<DropdownMenuItem<T>> values;
  final void Function(T?) onChange;
  const CasualDropdownMenu({
    super.key,
    required this.currValue,
    required this.values,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.setPadding(10),
          vertical: SizeConfig.setPadding(6)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
        color: kLightWhite,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(
              .25,
              1.5,
            ),
            color: kGrey.withOpacity(
              .5,
            ),
          ),
        ],
      ),
      child: DropdownButton<T>(
        value: currValue,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
        itemHeight: SizeConfig.screenHeight! * .035 >= kMinInteractiveDimension
            ? SizeConfig.screenHeight! * .035
            : kMinInteractiveDimension,
        icon: Padding(
          padding: EdgeInsets.only(left: SizeConfig.setPadding(12)),
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_forward_ios,
              color: kLightBlue,
              size: SizeConfig.iconSmall,
            ),
          ),
        ),
        items: values,
        onChanged: onChange,
      ),
    );
  }
}
