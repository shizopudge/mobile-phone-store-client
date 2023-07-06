import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../features/products/domain/entities/product.dart';
import '../../../../api/api_constants.dart';
import '../../../../styles/styles.dart';
import '../../../../utils/size_config.dart';
import 'discount.dart';
import 'product_message.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                        child: CachedNetworkImage(
                          imageUrl:
                              '${ApiConstants.imagesUrl}/${product.images[0]}',
                          imageBuilder: (context, imageProvider) => Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadiusDefault),
                            ),
                            child: Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: kGrey.withOpacity(.3),
                            highlightColor: kWhite,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: kGrey,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadiusDefault),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Shimmer.fromColors(
                            baseColor: kGrey.withOpacity(.3),
                            highlightColor: kWhite,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: kGrey,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadiusDefault),
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
                          if (product.hasDiscount)
                            Flexible(
                              child: AutoSizeText(
                                '\$${product.discountCost}',
                                overflow: TextOverflow.ellipsis,
                                minFontSize:
                                    (constraints.maxWidth * .1).ceilToDouble(),
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
                                minFontSize:
                                    (constraints.maxWidth * .1).ceilToDouble(),
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
                    child: ProductMessage(
                      text: 'OUT OF STOCK',
                      textColor: kDarkBlue,
                      backgroundColor: kGrey,
                      height: constraints.maxWidth * .15,
                    ),
                  )
                else if (product.isNew)
                  Positioned(
                    bottom: -constraints.maxWidth * .09,
                    child: ProductMessage(
                      text: 'NEW ARRIVAL',
                      textColor: kWhite,
                      backgroundColor: kOrange,
                      height: constraints.maxWidth * .15,
                    ),
                  ),
              ],
            ),
            if (product.hasDiscount)
              Positioned(
                top: -constraints.maxWidth * .03,
                right: -constraints.maxWidth * .05,
                child: Discount(
                  discount: product.discount,
                  fontSize: constraints.maxWidth * .1,
                  padding: constraints.maxWidth * .03,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
