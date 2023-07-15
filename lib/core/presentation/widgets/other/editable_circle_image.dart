import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/api_constants.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../../animations/fade_animation_x.dart';

class EditableCircleImage extends StatelessWidget {
  final VoidCallback onTap;
  final String? image;
  final File? pickedImage;
  const EditableCircleImage({
    super.key,
    required this.image,
    required this.pickedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = SizeConfig.radiusLarge;
    return GestureDetector(
      onTap: onTap,
      child: pickedImage != null
          ? kIsWeb
              ? CircleAvatar(
                  backgroundImage: NetworkImage(pickedImage!.path),
                  backgroundColor: kLightWhite,
                  radius: radius,
                )
              : CircleAvatar(
                  backgroundImage: FileImage(pickedImage!),
                  backgroundColor: kLightWhite,
                  radius: radius,
                )
          : image != null
              ? CachedNetworkImage(
                  imageUrl: '${ApiConstants.imagesUrl}/$image',
                  imageBuilder: (context, imageProvider) => Hero(
                    tag: image!,
                    child: CircleAvatar(
                      backgroundImage: imageProvider,
                      backgroundColor: kLightWhite,
                      radius: radius,
                    ),
                  ),
                  placeholder: (context, url) => FadeAnimationX(
                    delay: .25,
                    child: Shimmer.fromColors(
                      baseColor: kWhite,
                      highlightColor: kLightWhite,
                      child: CircleAvatar(
                        backgroundColor: kGrey,
                        radius: radius,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => FadeAnimationX(
                    delay: .25,
                    child: CircleAvatar(
                      backgroundColor: kGrey,
                      radius: radius,
                      child: Shimmer.fromColors(
                        baseColor: kWhite,
                        highlightColor: kLightWhite,
                        child: Icon(
                          Icons.image,
                          color: kWhite,
                          size: SizeConfig.iconMedium,
                        ),
                      ),
                    ),
                  ),
                )
              : FadeAnimationX(
                  delay: .25,
                  child: CircleAvatar(
                    backgroundColor: kDarkBlue,
                    radius: radius,
                    child: Icon(
                      Icons.file_upload_rounded,
                      color: kWhite,
                      size: SizeConfig.iconMedium,
                    ),
                  ),
                ),
    );
  }
}
