import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/buttons/rounded_icon_button.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';

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
    final List<Product> cart =
        context.select<CartBloc, List<Product>>((bloc) => bloc.state.products);
    return Column(
      children: [
        FadeAnimationYDown(
          delay: .6,
          child: AnimatedContainer(
            height: showInfo ? 0 : SizeConfig.h2 * 1.25,
            duration: const Duration(milliseconds: 550),
            color: Colors.transparent,
            child: AnimatedOpacity(
              opacity: showInfo ? 0 : 1,
              duration: const Duration(milliseconds: 350),
              child: AnimatedSlide(
                offset: Offset(0, showInfo ? 1 : 0),
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 250),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.setPadding(20)),
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
        ),
        SizedBox(height: SizeConfig.setPadding(2)),
        FadeAnimationYDown(
          delay: .7,
          child: Container(
            color: kLightWhite,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.setPadding(8),
              vertical: SizeConfig.setPadding(2.5),
            ),
            child: Row(
              children: [
                if (user != null)
                  if (!user.isAdmin)
                    RoundedIconButton(
                      onTap: () => context
                          .read<CartBloc>()
                          .add(CartEvent.toggleCart(product)),
                      innerPadding: 12,
                      child: Icon(
                        product.isInCart(cart)
                            ? Icons.shopping_bag_rounded
                            : Icons.shopping_bag_outlined,
                        color: kDarkBlue,
                        size: SizeConfig.iconLarge,
                      ),
                    ),
                if (user != null)
                  SizedBox(
                    width: SizeConfig.setPadding(8),
                  ),
                if (user != null && !user.isAdmin)
                  Expanded(
                    child: CasualButton(
                      onTap: () {},
                      borderRadius: SizeConfig.borderRadiusSmall,
                      text: product.isDiscounted
                          ? 'Checkout \$${product.discountCost}'
                          : 'Checkout \$${product.cost}',
                      isEnabled: !product.isOutOfStock,
                      fontSize: SizeConfig.body1,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
