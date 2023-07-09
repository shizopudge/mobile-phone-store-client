import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/product.dart';
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
      child: DropdownButton(
        value: product.storage,
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
        items: List.generate(product.storages.length, (index) {
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
        onChanged: (storage) => context
            .read<DetailedProductBloc>()
            .add(DetailedProductEvent.changeStorage(storage)),
      ),
    );
  }
}
