import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/api_constants.dart';
import '../../../styles/styles.dart';

class CasualNetworkImage extends StatelessWidget {
  final String imageName;
  final Widget Function(
      BuildContext context, ImageProvider<Object> imageProvider) imageBuilder;
  final Widget placeholder;
  final Widget error;
  const CasualNetworkImage({
    super.key,
    required this.imageName,
    required this.imageBuilder,
    required this.placeholder,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '${ApiConstants.imagesUrl}/$imageName',
      imageBuilder: imageBuilder,
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: kGrey.withOpacity(.3),
        highlightColor: kWhite,
        child: placeholder,
      ),
      errorWidget: (_, __, ___) => Shimmer.fromColors(
        baseColor: kGrey.withOpacity(.3),
        highlightColor: kWhite,
        child: error,
      ),
    );
  }
}
