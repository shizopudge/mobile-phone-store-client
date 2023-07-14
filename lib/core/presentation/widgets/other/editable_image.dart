import 'dart:io';

import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import 'casual_network_image.dart';

class EditableImage extends StatelessWidget {
  final VoidCallback onTap;
  final String? image;
  final File? pickedImage;
  const EditableImage({
    super.key,
    required this.onTap,
    this.image,
    this.pickedImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: pickedImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
              child: SizedBox(
                height: SizeConfig.screenWidth! * .5,
                child: Image(
                  image: FileImage(pickedImage!),
                ),
              ),
            )
          : image != null
              ? CasualNetworkImage(
                  imageName: image!,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadiusSmall),
                    child: SizedBox(
                      height: SizeConfig.screenWidth! * .5,
                      child: Image(
                        image: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: SizedBox(
                    height: SizeConfig.screenWidth! * .5,
                    child: const FittedBox(
                      fit: BoxFit.cover,
                      child: Icon(
                        Icons.image,
                      ),
                    ),
                  ),
                  error: SizedBox(
                    height: SizeConfig.screenWidth! * .5,
                    child: const FittedBox(
                      fit: BoxFit.cover,
                      child: Icon(
                        Icons.image,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: SizeConfig.screenWidth! * .25,
                  child: const FittedBox(
                    fit: BoxFit.cover,
                    child: Icon(
                      Icons.upload_rounded,
                    ),
                  ),
                ),
    );
  }
}
