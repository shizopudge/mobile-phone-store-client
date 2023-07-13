import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/widgets/other/casual_dropdown_menu.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/detailed_product_bloc.dart';

class DetailedProductStorageMenu extends StatelessWidget {
  final Product product;
  const DetailedProductStorageMenu({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return CasualDropdownMenu(
      currValue: product.storage,
      values: List.generate(product.storages.length, (index) {
        final isAvailable =
            product.availableStorages.contains(product.storages[index]);
        return DropdownMenuItem(
          value: product.storages[index],
          child: Text(
            '${product.storages[index]}GB',
            style: kSemiBold.copyWith(
              color: isAvailable ? kDarkBlue : kGrey,
              fontSize: SizeConfig.body1,
            ),
          ),
        );
      }),
      onChange: (storage) => context
          .read<DetailedProductBloc>()
          .add(DetailedProductEvent.changeStorage(storage)),
    );
  }
}
