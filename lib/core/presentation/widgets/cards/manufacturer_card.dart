import 'package:flutter/material.dart';

import '../../../domain/entities/manufacturer.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../other/casual_network_image.dart';

class ManufacturerCard extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final Manufacturer manufacturer;
  const ManufacturerCard({
    super.key,
    required this.onTap,
    required this.onLongPress,
    required this.manufacturer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusSmall,
          ),
          color: kLightWhite,
          boxShadow: [
            BoxShadow(
              color: kDarkBlue.withOpacity(.3),
              blurRadius: 8,
              spreadRadius: .5,
              offset: const Offset(
                .25,
                5,
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            if (manufacturer.image != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.borderRadiusSmall,
                    ),
                    child: CasualNetworkImage(
                      imageName: manufacturer.image!,
                      imageBuilder: (context, imageProvider) => Image(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                      placeholder: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: kGrey,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.borderRadiusSmall),
                        ),
                      ),
                      error: const Icon(
                        Icons.image,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadiusDefault),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(
                      Icons.image,
                      color: kDarkBlue.withOpacity(.5),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8)
                  .copyWith(top: 8, bottom: 20),
              child: Text(
                manufacturer.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kBold.copyWith(
                  color: kDarkBlue,
                  fontSize: SizeConfig.body3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
