import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class EditableUserImage extends StatelessWidget {
  final VoidCallback onTap;
  final String? userImage;
  final File? pickedImage;
  const EditableUserImage({
    super.key,
    required this.userImage,
    required this.pickedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = SizeConfig.radiusLarge;
    return GestureDetector(
      onTap: onTap,
      child: pickedImage != null
          ? CircleAvatar(
              backgroundImage: FileImage(pickedImage!),
              backgroundColor: kLightWhite,
              radius: radius,
            )
          : CachedNetworkImage(
              imageUrl: '${ApiConstants.imagesUrl}/$userImage',
              imageBuilder: (context, imageProvider) => Hero(
                tag: 'user_image',
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
                  backgroundColor: kDarkBlue,
                  radius: radius,
                  child: Icon(
                    Icons.file_upload_rounded,
                    color: kWhite,
                    size: SizeConfig.iconMedium,
                  ),
                ),
              ),
            ),
    );
  }
}
