import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/styles/styles.dart';

class ProfileEditUserImage extends StatelessWidget {
  final VoidCallback onTap;
  final String? userImage;
  final File? pickedImage;
  const ProfileEditUserImage({
    super.key,
    required this.userImage,
    required this.pickedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: pickedImage != null
          ? CircleAvatar(
              backgroundImage: FileImage(pickedImage!),
              backgroundColor: kGrey,
              radius: 75,
            )
          : CachedNetworkImage(
              imageUrl: '${ApiConstants.imagesUrl}/$userImage',
              imageBuilder: (context, imageProvider) => Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: 'user_image',
                    child: CircleAvatar(
                      backgroundImage: imageProvider,
                      backgroundColor: kGrey,
                      radius: 75,
                    ),
                  ),
                  const Positioned(
                    top: 8,
                    right: -5,
                    child: FadeAnimationX(
                      delay: .25,
                      child: Icon(
                        Icons.edit,
                        color: kDarkBlue,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              placeholder: (context, url) => FadeAnimationX(
                delay: .25,
                child: Shimmer.fromColors(
                  baseColor: kGrey,
                  highlightColor: kWhite,
                  child: const CircleAvatar(
                    backgroundColor: kGrey,
                    radius: 75,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const FadeAnimationX(
                delay: .25,
                child: CircleAvatar(
                  backgroundColor: kDarkBlue,
                  radius: 75,
                  child: Icon(
                    Icons.file_upload_rounded,
                    color: kWhite,
                    size: 50,
                  ),
                ),
              ),
            ),
    );
  }
}
