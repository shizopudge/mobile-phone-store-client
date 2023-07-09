import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/widgets/buttons/rounded_icon_button.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/detailed_product_bloc.dart';

class DetailedProductHeader extends StatelessWidget {
  final Product product;
  const DetailedProductHeader({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final CurrentUser? user =
        context.select<AuthBloc, CurrentUser?>((bloc) => bloc.state.user);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedIconButton(
          onTap: () {
            Navigator.of(context).pop();
            context
                .read<DetailedProductBloc>()
                .add(const DetailedProductEvent.changeProduct(null));
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: kDarkBlue,
            size: SizeConfig.iconMedium,
          ),
        ),
        if (user != null)
          RoundedIconButton(
            onTap: () {},
            child: Icon(
              product.isInWishlist(user.wishlist)
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              color: kDarkBlue,
              size: SizeConfig.iconMedium,
            ),
          ),
      ],
    );
  }
}