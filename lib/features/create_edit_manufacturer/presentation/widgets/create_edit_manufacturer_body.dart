import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/other/editable_image.dart';
import '../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../core/utils/size_config.dart';

class CreateEditManufacturerBody extends StatelessWidget {
  final void Function(String? image) onImageTap;
  final TextEditingController nameController;
  final String? currImage;
  final File? pickedImage;
  const CreateEditManufacturerBody({
    super.key,
    required this.onImageTap,
    required this.nameController,
    required this.pickedImage,
    required this.currImage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.setPadding(SizeConfig.isMobile
                    ? 20
                    : SizeConfig.isTablet
                        ? 40
                        : 100),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  SizedBox(
                    height: SizeConfig.isMobile
                        ? SizeConfig.screenWidth! * .5
                        : SizeConfig.isTablet
                            ? SizeConfig.screenWidth! * .5
                            : SizeConfig.screenWidth! * .25,
                    child: EditableImage(
                      image: currImage,
                      pickedImage: pickedImage,
                      onTap: () => onImageTap(currImage),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  CasualTextField(
                    controller: nameController,
                    hintText: 'Manufacturer name',
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
