import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/detailed_product_bloc.dart';
import 'detailed_product_color.dart';

class DetailedProductColors extends StatelessWidget {
  final Product product;
  const DetailedProductColors({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConfig.borderRadiusDefault),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: product.colors.length,
        itemBuilder: (context, index) {
          final String colorCode = product.colors[index];
          final isAvailable = product.availableColors.contains(colorCode);
          return DetailedProductColor(
            onTap: () => context
                .read<DetailedProductBloc>()
                .add(DetailedProductEvent.changeColor(colorCode)),
            selectedColorCode: product.colorCode,
            colorCode: colorCode,
            isAvailable: isAvailable,
          );
        },
      ),
    );
  }
}
