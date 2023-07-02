import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/styles/styles.dart';
import '../../domain/entities/product.dart';
import 'product_card_message.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kLightWhite,
        borderRadius: BorderRadius.circular(21),
        boxShadow: [
          BoxShadow(
            color: kDarkBlue.withOpacity(.2),
            blurRadius: 15,
            offset: const Offset(
              .5,
              3,
            ),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              if (product.images.isNotEmpty)
                Flexible(
                  child: Stack(
                    alignment: Alignment.topRight,
                    clipBehavior: Clip.none,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            '${ApiConstants.imagesUrl}/${product.images[0]}',
                        imageBuilder: (context, imageProvider) => Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
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
                              borderRadius: BorderRadius.circular(21),
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
                              borderRadius: BorderRadius.circular(21),
                            ),
                          ),
                        ),
                      ),
                      if (product.hasDiscount)
                        Positioned(
                          top: MediaQuery.of(context).size.width * .005,
                          right: MediaQuery.of(context).size.width * .01,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            height: MediaQuery.of(context).size.width * .1,
                            decoration: const BoxDecoration(
                              color: kOrange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '${product.discount}%',
                                minFontSize: 12,
                                style:
                                    kBold.copyWith(color: kWhite, fontSize: 50),
                              ),
                            ),
                          ),
                        ),
                    ],
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
                        minFontSize: 12,
                        style: kSemiBold.copyWith(
                          fontSize: 200,
                          color: kDarkBlue,
                        ),
                      ),
                    ),
                    if (product.hasDiscount)
                      Flexible(
                        child: AutoSizeText(
                          '\$${product.discountCost}',
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 12,
                          style: kBold.copyWith(
                            fontSize: 200,
                            color: kRed,
                          ),
                        ),
                      )
                    else
                      Flexible(
                        child: AutoSizeText(
                          '\$${product.cost}',
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 12,
                          style: kBold.copyWith(
                            fontSize: 200,
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
              bottom: -MediaQuery.of(context).size.width * .04,
              child: const ProductCardMessage(
                text: 'OUT OF STOCK',
                textColor: kDarkBlue,
                backgroundColor: kGrey,
              ),
            )
          else if (product.isNew)
            Positioned(
              bottom: -MediaQuery.of(context).size.width * .04,
              child: const ProductCardMessage(
                text: 'NEW ARRIVAL',
                textColor: kWhite,
                backgroundColor: kOrange,
              ),
            ),
        ],
      ),
    );
  }
}
