import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/presentation/widgets/scrollable/simple_slider.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class DetailedProductGalleryDialog extends StatelessWidget {
  final List<String> images;
  final int initPage;
  const DetailedProductGalleryDialog({
    super.key,
    required this.images,
    required this.initPage,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        backgroundColor: kLightWhite,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.setPadding(20),
            vertical: SizeConfig.setPadding(50)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusSmall,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.setPadding(8)),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: CloseButton(
                  color: kDarkBlue,
                ),
              ),
              Expanded(
                child: SimpleSlider(
                  initialPage: initPage,
                  itemCount: images.length,
                  bottomActiveButtonColor: kBlack,
                  itemBuilder: (index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CachedNetworkImage(
                      imageUrl: '${ApiConstants.imagesUrl}/${images[index]}',
                      fit: BoxFit.contain,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.borderRadiusSmall),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: kWhite,
                        highlightColor: kLightWhite,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadiusSmall),
                            color: kGrey,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.image,
                        color: kDarkBlue,
                        size: SizeConfig.iconLarger,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
