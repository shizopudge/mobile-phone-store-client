import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import 'detailed_product_gallery_dialog.dart';
import 'detailed_product_galley_image.dart';

class DetailedProductGallery extends StatelessWidget {
  final List<String> images;
  const DetailedProductGallery({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final String image = images[index];
          return DetailedProductGalleryImage(
              onTap: () => showDialog(
                    context: context,
                    useSafeArea: true,
                    builder: (context) => DetailedProductGalleryDialog(
                      images: images,
                      initPage: index,
                    ),
                  ),
              image: image);
        },
      ),
    );
  }
}
