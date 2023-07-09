import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/presentation/widgets/loading/casual_loader.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class DetailedProductImage extends StatelessWidget {
  final String? image;
  const DetailedProductImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: kGrey.withOpacity(.2),
          radius: SizeConfig.radiusLarger,
        ),
        if (image != null)
          CachedNetworkImage(
            imageUrl: '${ApiConstants.imagesUrl}/$image',
            height: SizeConfig.radiusLarger * 1.5,
            width: SizeConfig.radiusLarger * 1.5,
            fit: BoxFit.contain,
            color: Colors.transparent,
            imageBuilder: (context, imageProvider) => Hero(
              tag: image!,
              child: Image(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
            placeholder: (context, url) => const CasualLoader(
              color: kDarkBlue,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.image,
              color: kDarkBlue,
              size: SizeConfig.iconLarger,
            ),
          )
        else
          Icon(
            Icons.image,
            color: kDarkBlue,
            size: SizeConfig.iconLarger,
          ),
      ],
    );
  }
}
