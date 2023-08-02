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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
          color: kBlack,
          boxShadow: const [
            BoxShadow(
              color: kGrey,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            overflow: TextOverflow.ellipsis,
            style: kBold.copyWith(
              color: kLightWhite,
              fontSize: SizeConfig.h2,
            ),
          ),
          Text(
            'Products count: ${model.products.length}',
            overflow: TextOverflow.ellipsis,
            style: kMedium.copyWith(
              color: kGrey,
              fontSize: SizeConfig.body1,
            ),
          ),
        ],
      ),
    );
  }
}
