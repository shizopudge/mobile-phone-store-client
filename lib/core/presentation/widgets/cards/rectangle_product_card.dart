import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../other/casual_network_image.dart';
import '../other/discount.dart';
import '../other/tag.dart';

class RectangleProductCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Product product;
  const RectangleProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 7,
      child: GestureDetector(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: const EdgeInsets.all(12),
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
                    Row(
                      children: [
                        if (product.images.isNotEmpty)
                          Expanded(
                            child: CasualNetworkImage(
                              imageName: product.images[0],
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadiusSmall),
                                ),
                                child: Image(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              placeholder: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: kGrey,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadiusSmall),
                                ),
                              ),
                              error: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadiusSmall),
                                ),
                                child: const FittedBox(
                                  fit: BoxFit.cover,
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
                              padding: const EdgeInsets.all(5),
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
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  minFontSize: (constraints.maxWidth * .035)
                                      .ceilToDouble(),
                                  style: kSemiBold.copyWith(
                                    fontSize: constraints.maxWidth * .08,
                                    color: kDarkBlue,
                                  ),
                                ),
                              ),
                              if (product.isDiscounted)
                                Flexible(
                                  child: AutoSizeText(
                                    '\$${product.discountCost}',
                                    overflow: TextOverflow.ellipsis,
                                    minFontSize: (constraints.maxWidth * .04)
                                        .ceilToDouble(),
                                    style: kBold.copyWith(
                                      fontSize: constraints.maxWidth * .1,
                                      color: kRed,
                                    ),
                                  ),
                                )
                              else
                                Flexible(
                                  child: AutoSizeText(
                                    '\$${product.cost}',
                                    overflow: TextOverflow.ellipsis,
                                    minFontSize: (constraints.maxWidth * .04)
                                        .ceilToDouble(),
                                    style: kBold.copyWith(
                                      fontSize: constraints.maxWidth * .1,
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
                        bottom: -constraints.maxWidth * .065,
                        child: Tag(
                          text: 'OUT OF STOCK',
                          textColor: kDarkBlue,
                          backgroundColor: kGrey,
                          height: constraints.maxWidth * .08,
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
                        bottom: -constraints.maxWidth * .065,
                        child: Tag(
                          text: 'NEW ARRIVAL',
                          textColor: kWhite,
                          backgroundColor: kOrange,
                          height: constraints.maxWidth * .08,
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
                    top: -constraints.maxWidth * .06,
                    right: -constraints.maxWidth * .045,
                    child: Discount(
                      discount: product.discount,
                      fontSize: constraints.maxWidth * .05,
                      padding: constraints.maxWidth * .03,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
