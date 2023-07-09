import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/buttons/rounded_icon_button.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class DetailedProductBottom extends StatelessWidget {
  final Product product;
  final bool showInfo;
  const DetailedProductBottom({
    super.key,
    required this.product,
    required this.showInfo,
  });

  @override
  Widget build(BuildContext context) {
    final CurrentUser? user =
        context.select<AuthBloc, CurrentUser?>((bloc) => bloc.state.user);
    return Column(
      children: [
        AnimatedContainer(
          height: showInfo ? 0 : SizeConfig.h2 * 1.25,
          duration: const Duration(milliseconds: 550),
          child: AnimatedOpacity(
            opacity: showInfo ? 0 : 1,
            duration: const Duration(milliseconds: 350),
            child: AnimatedSlide(
              offset: Offset(0, showInfo ? 1 : 0),
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 250),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(20)),
                child: Shimmer.fromColors(
                  baseColor: kDarkBlue,
                  highlightColor: kLightWhite,
                  period: const Duration(milliseconds: 3000),
                  child: Text(
                    'Scroll down to see more',
                    style: kSemiBold.copyWith(
                      color: kDarkBlue,
                      fontSize: SizeConfig.h2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: SizeConfig.setPadding(2)),
        Container(
          color: kLightWhite,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.setPadding(8),
            vertical: SizeConfig.setPadding(2.5),
          ),
          child: Row(
            children: [
              RoundedIconButton(
                onTap: () {},
                innerPadding: 12,
                child: Icon(
                  product.isInCart(user?.cart ?? [])
                      ? Icons.shopping_bag_rounded
                      : Icons.shopping_bag_outlined,
                  color: kDarkBlue,
                  size: SizeConfig.iconLarge,
                ),
              ),
              SizedBox(
                width: SizeConfig.setPadding(8),
              ),
              Expanded(
                child: CasualButton(
                  onTap: () {},
                  borderRadius: SizeConfig.borderRadiusSmall,
                  text: 'Checkout \$${product.cost}',
                  isEnabled: !product.isOutOfStock,
                  fontSize: SizeConfig.body1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
