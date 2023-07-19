import 'package:flutter/material.dart';

import '../../../domain/entities/payment.dart';
import '../../../domain/entities/product.dart';
import '../../../styles/colors.dart';
import '../../../styles/fonts.dart';
import '../../../utils/size_config.dart';
import '../../animations/fade_animation_y_down.dart';
import '../buttons/casual_button.dart';
import '../cards/rectangle_product_card.dart';
import 'casual_bottom_sheet.dart';

class CreatePurchaseBottomSheet extends StatelessWidget {
  final Payment payment;
  final List<Product> products;
  final VoidCallback onPay;
  const CreatePurchaseBottomSheet({
    super.key,
    required this.payment,
    required this.products,
    required this.onPay,
  });

  @override
  Widget build(BuildContext context) {
    return CasualBottomSheet(
      title: 'Purchase',
      child: Expanded(
        child: FadeAnimationYDown(
          delay: .5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cost: ${payment.cost} ${payment.currency}',
                    style: kBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.h2),
                  ),
                  Text(
                    'Description: ${payment.description}',
                    style: kMedium.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.body1),
                  ),
                ],
              ),
              Expanded(
                child: SizeConfig.isMobile
                    ? ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => RectangleProductCard(
                          product: products[index],
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: SizeConfig.isTablet ? 2 : 3,
                            childAspectRatio: SizeConfig.isTablet ? 1.5 : 1.75),
                        itemCount: products.length,
                        itemBuilder: (context, index) => RectangleProductCard(
                          product: products[index],
                        ),
                      ),
              ),
              CasualButton(
                onTap: onPay,
                text: 'Pay',
                fontSize: SizeConfig.h1,
                borderRadius: SizeConfig.borderRadiusSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
