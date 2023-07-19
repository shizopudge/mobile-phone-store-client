import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../other/casual_network_image.dart';
import '../other/discount.dart';
import '../other/tag.dart';

class SquareProductCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Product product;
  final bool withHero;
  const SquareProductCard({
    super.key,
    this.onTap,
    required this.product,
    this.withHero = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kLightWhite,
            borderRadius: BorderRadius.circular(
              SizeConfig.borderRadiusSmall,
            ),
            boxShadow: [
              BoxShadow(
                color: kDarkBlue.withOpacity(.3),
                blurRadius: 8,
                spreadRadius: .5,
                offset: const Offset(
                  .25,
                  5,
                ),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      if (product.images.isNotEmpty)
                        Expanded(
                          child: CasualNetworkImage(
                            imageName: product.images[0],
                            imageBuilder: (context, imageProvider) => withHero
                                ? Hero(
                                    tag: product.images[0],
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.borderRadiusSmall),
                                      ),
                                      child: Image(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.borderRadiusSmall),
                                    ),
                                    child: Image(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            placeholder: Container(
                              decoration: BoxDecoration(
                                color: kGrey,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadiusSmall),
                              ),
                            ),
                            error: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadiusSmall),
                              ),
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                child: Icon(
                                  Icons.image,
                                  color: kDarkBlue,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadiusDefault),
                            ),
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: Icon(
                                Icons.image,
                                color: kDarkBlue,
                              ),
                            ),
                          ),
                        ),
                      Flexible(
                        child: Column(
                          children: [
                            Flexible(
                              child: AutoSizeText(
                                product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                minFontSize:
                                    (constraints.maxWidth * .1).ceilToDouble(),
                                style: kSemiBold.copyWith(
                                  fontSize: constraints.maxWidth * .25,
                                  color: kDarkBlue,
                                ),
                              ),
                            ),
                            if (product.isDiscounted)
                              Flexible(
                                child: AutoSizeText(
                                  '\$${product.discountCost}',
                                  overflow: TextOverflow.ellipsis,
                                  minFontSize: (constraints.maxWidth * .1)
                                      .ceilToDouble(),
                                  style: kBold.copyWith(
                                    fontSize: constraints.maxWidth * .18,
                                    color: kRed,
                                  ),
                                ),
                              )
                            else
                              Flexible(
                                child: AutoSizeText(
                                  '\$${product.cost}',
                                  overflow: TextOverflow.ellipsis,
                                  minFontSize: (constraints.maxWidth * .1)
                                      .ceilToDouble(),
                                  style: kBold.copyWith(
                                    fontSize: constraints.maxWidth * .18,
                                    color: kLightBlue,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (product.isOutOfStock)
                    Positioned(
                      bottom: -constraints.maxWidth * .09,
                      child: Tag(
                        text: 'OUT OF STOCK',
                        textColor: kDarkBlue,
                        backgroundColor: kGrey,
                        height: constraints.maxWidth * .15,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: kDarkBlue.withOpacity(.35),
                            offset: const Offset(
                              0,
                              -.5,
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (product.isNew)
                    Positioned(
                      bottom: -constraints.maxWidth * .09,
                      child: Tag(
                        text: 'NEW ARRIVAL',
                        textColor: kWhite,
                        backgroundColor: kOrange,
                        height: constraints.maxWidth * .15,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: kDarkBlue.withOpacity(.35),
                            offset: const Offset(
                              0,
                              -.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              if (product.isDiscounted)
                Positioned(
                  top: -constraints.maxWidth * .075,
                  right: -constraints.maxWidth * .07,
                  child: Discount(
                    discount: product.discount,
                    fontSize: constraints.maxWidth * .1,
                    padding: constraints.maxWidth * .045,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
