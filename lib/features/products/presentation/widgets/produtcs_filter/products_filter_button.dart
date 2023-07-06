import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';
import '../../../../../core/utils/size_config.dart';

class ProductsFilterButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isEnabled;
  final String text;
  const ProductsFilterButton({
    super.key,
    required this.onTap,
    required this.isEnabled,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 125),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadius,
          ),
          border: Border.all(
            width: 1.2,
            color: kGrey,
          ),
          color: isEnabled ? kOrange : Colors.transparent,
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: kRegular.copyWith(
                  fontSize: SizeConfig.body2, color: kDarkBlue),
            ),
          ),
        ),
      ),
    );
  }
}
