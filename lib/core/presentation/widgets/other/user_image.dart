import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/api_constants.dart';
import '../../../styles/styles.dart';

class CasualRoundedNetworkImage extends StatelessWidget {
  final String? image;
  final double radius;
  const CasualRoundedNetworkImage({
    super.key,
    required this.image,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '${ApiConstants.imagesUrl}/$image',
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
        backgroundColor: kGrey,
        radius: radius,
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: kGrey,
        highlightColor: kWhite,
        child: CircleAvatar(
          backgroundColor: kGrey,
          radius: radius,
        ),
      ),
      errorWidget: (context, url, error) => Shimmer.fromColors(
        baseColor: kGrey,
        highlightColor: kWhite,
        child: CircleAvatar(
          backgroundColor: kGrey,
          radius: radius,
        ),
      ),
    );
  }
}
