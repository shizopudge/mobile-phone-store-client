import 'package:flutter/material.dart';

import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class CartInfo extends StatefulWidget {
  final double totalCost;
  final int productsCount;
  const CartInfo({
    super.key,
    required this.totalCost,
    required this.productsCount,
  });

  @override
  State<CartInfo> createState() => _CartInfoState();
}

class _CartInfoState extends State<CartInfo> {
  final ValueNotifier<bool> _isShown = ValueNotifier(true);

  @override
  void dispose() {
    _isShown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isShown,
      builder: (context, isShown, _) => IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.setPadding(25),
          ).copyWith(
              bottom: SizeConfig.setPadding(15), top: SizeConfig.setPadding(8)),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: SizeConfig.isTablet
                ? BorderRadius.only(
                    topRight: Radius.circular(
                      SizeConfig.borderRadiusSmall,
                    ),
                  )
                : BorderRadius.vertical(
                    top: Radius.circular(
                      SizeConfig.borderRadiusSmall,
                    ),
                  ),
            color: kLightWhite,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -4),
                blurRadius: 5,
                spreadRadius: 3,
                color: kGrey.withOpacity(.55),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeAnimationX(
                    delay: .1,
                    child: Text(
                      'Cart',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: kSemiBold.copyWith(
                        fontSize: SizeConfig.h3,
                        color: kLightBlue,
                      ),
                    ),
                  ),
                  if (isShown)
                    FadeAnimationX(
                      delay: .2,
                      child: IconButton(
                        onPressed: () => _isShown.value = false,
                        icon: Icon(
                          Icons.close,
                          color: kLightBlue,
                          size: SizeConfig.iconMedium,
                        ),
                      ),
                    )
                  else
                    FadeAnimationX(
                      delay: .2,
                      child: IconButton(
                        onPressed: () => _isShown.value = true,
                        icon: Icon(
                          Icons.open_in_full_rounded,
                          color: kLightBlue,
                          size: SizeConfig.iconMedium,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: SizeConfig.setPadding(2),
              ),
              if (isShown)
                Column(
                  children: [
                    FadeAnimationX(
                      delay: .3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: kLightBlue,
                            size: SizeConfig.iconMedium,
                          ),
                          SizedBox(
                            width: SizeConfig.setPadding(6),
                          ),
                          Text(
                            'Total cost: \$${widget.totalCost}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: kMedium.copyWith(
                              fontSize: SizeConfig.body1,
                              color: kDarkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(8),
                    ),
                    FadeAnimationX(
                      delay: .4,
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_rounded,
                            color: kLightBlue,
                            size: SizeConfig.iconMedium,
                          ),
                          SizedBox(
                            width: SizeConfig.setPadding(6),
                          ),
                          Text(
                            'Products count: ${widget.productsCount}',
                            overflow: TextOverflow.ellipsis,
                            style: kMedium.copyWith(
                              fontSize: SizeConfig.body1,
                              color: kDarkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(8),
                    ),
                    FadeAnimationX(
                      delay: .5,
                      child: CasualButton(
                        onTap: () {},
                        text: 'Buy all',
                        fontSize: SizeConfig.body2,
                        borderRadius: SizeConfig.borderRadiusSmall,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
