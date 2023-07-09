import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class DetailedProductGalleryImage extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  const DetailedProductGalleryImage({
    super.key,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.setPadding(12)),
      child: AspectRatio(
        aspectRatio: 1 / 1.1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: kLightWhite,
              borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(
                    .25,
                    1.5,
                  ),
                  color: kGrey.withOpacity(
                    .5,
                  ),
                ),
              ],
            ),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.imagesUrl}/$image',
              fit: BoxFit.contain,
              imageBuilder: (context, imageProvider) => Container(
                padding: EdgeInsets.all(SizeConfig.setPadding(6)),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadiusSmall),
                ),
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: kWhite,
                highlightColor: kLightWhite,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadiusSmall),
                    color: kGrey,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.image,
                color: kDarkBlue,
                size: SizeConfig.iconMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
