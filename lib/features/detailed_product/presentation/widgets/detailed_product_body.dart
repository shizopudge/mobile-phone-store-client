import 'package:flutter/material.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/fonts.dart';
import '../../../../core/utils/size_config.dart';
import 'detailed_product_colors.dart';
import 'detailed_product_gallery.dart';
import 'detailed_product_image.dart';
import 'detailed_product_info.dart';
import 'detailed_product_item.dart';
import 'detailed_product_storage_menu.dart';

class DetailedProductBody extends StatelessWidget {
  final Product product;
  final ScrollController scrollController;
  final bool showInfo;
  const DetailedProductBody({
    super.key,
    required this.product,
    required this.scrollController,
    required this.showInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: SizeConfig.isMobile
              ? SizeConfig.screenHeight! * .15
              : SizeConfig.screenHeight! * .1,
          right: SizeConfig.isMobile
              ? -SizeConfig.screenWidth! * .34
              : SizeConfig.isTablet
                  ? -SizeConfig.screenWidth! * .12
                  : -SizeConfig.screenWidth! * .075,
          child: DetailedProductImage(
            image: product.images.isNotEmpty ? product.images[0] : null,
          ),
        ),
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.setPadding(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.setPadding(20),
                ),
                child: SizedBox(
                  width: SizeConfig.screenWidth! * .5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: kBold.copyWith(
                          fontSize: SizeConfig.h1,
                          color: kDarkBlue,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.setPadding(20),
                      ),
                      DetailedProductItem(
                        title: product.color,
                        child: SizedBox(
                          height: SizeConfig.isMobile
                              ? SizeConfig.screenWidth! * .1
                              : SizeConfig.isTablet
                                  ? SizeConfig.screenWidth! * .075
                                  : SizeConfig.screenWidth! * .04,
                          child: DetailedProductColors(
                            product: product,
                          ),
                        ),
                      ),
                      if (product.images.isNotEmpty)
                        SizedBox(
                          height: SizeConfig.setPadding(20),
                        ),
                      if (product.images.isNotEmpty)
                        DetailedProductItem(
                          title: 'Gallery',
                          child: SizedBox(
                            height: SizeConfig.isMobile
                                ? SizeConfig.screenWidth! * .15
                                : SizeConfig.isTablet
                                    ? SizeConfig.screenWidth! * .12
                                    : SizeConfig.screenWidth! * .08,
                            child: DetailedProductGallery(
                              images: product.images,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: SizeConfig.setPadding(20),
                      ),
                      DetailedProductItem(
                        title: 'Storage',
                        child: DetailedProductStorageMenu(
                          product: product,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.setPadding(20),
              ),
              AnimatedOpacity(
                opacity: showInfo ? 1 : 0,
                duration: const Duration(milliseconds: 750),
                child: AnimatedSlide(
                  offset: Offset(0, showInfo ? 0 : 1),
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                  child: DetailedProductInfo(product: product),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
