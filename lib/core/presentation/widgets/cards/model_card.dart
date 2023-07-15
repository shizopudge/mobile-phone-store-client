import 'package:flutter/material.dart';

import '../../../domain/entities/model.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class ModelCard extends StatelessWidget {
  const ModelCard({
    super.key,
    required this.model,
  });

  final Model model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.setPadding(12)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
          border: Border.all(
            color: kGrey,
            width: 1.2,
          ),
          color: kLightWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: kBold.copyWith(
              color: kDarkBlue,
              fontSize: SizeConfig.h1,
            ),
          ),
          Text(
            'Products count: ${model.products.length}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: kBold.copyWith(
              color: kDarkBlue,
              fontSize: SizeConfig.body1,
            ),
          ),
        ],
      ),
    );
  }
}
