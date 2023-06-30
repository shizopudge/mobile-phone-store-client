import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/user_image.dart';
import '../../../../core/styles/styles.dart';

class ProfileEditUserImage extends StatelessWidget {
  final String? userImage;
  final File? pickedImage;
  const ProfileEditUserImage({
    super.key,
    required this.userImage,
    required this.pickedImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: pickedImage != null
          ? CircleAvatar(
              backgroundImage: FileImage(pickedImage!),
              radius: 75,
            )
          : userImage != null
              ? Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                    Hero(
                      tag: 'user_image',
                      child: UserImage(
                        image: userImage,
                        radius: 75,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: -5,
                      child: Icon(
                        Icons.edit,
                        color: kDarkBlue,
                        size: 32,
                      ),
                    ),
                  ],
                )
              : const CircleAvatar(
                  backgroundColor: kDarkBlue,
                  radius: 75,
                  child: Icon(
                    Icons.file_upload_rounded,
                    color: kWhite,
                    size: 50,
                  ),
                ),
    );
  }
}
