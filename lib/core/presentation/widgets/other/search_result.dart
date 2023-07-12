import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class SearchResult extends StatelessWidget {
  final int pageCount;
  final int productsCount;
  final bool showSearchResult;
  const SearchResult({
    super.key,
    required this.pageCount,
    required this.productsCount,
    required this.showSearchResult,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      offset: Offset(showSearchResult ? 0 : 1, 0),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        opacity: showSearchResult ? 1 : 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          height: showSearchResult ? null : 0,
          width: showSearchResult ? null : 0,
          margin: showSearchResult
              ? EdgeInsets.symmetric(
                  horizontal: SizeConfig.setPadding(12),
                ).copyWith(top: SizeConfig.setPadding(15))
              : null,
          padding: EdgeInsets.all(SizeConfig.setPadding(8)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
            color: kLightWhite,
          ),
          child: Column(
            children: [
              Text(
                'Search result',
                textAlign: TextAlign.center,
                style: kSemiBold.copyWith(
                  fontSize: SizeConfig.h3,
                  color: kDarkBlue,
                ),
              ),
              SizedBox(
                height: SizeConfig.setPadding(8),
              ),
              Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Page count',
                      textAlign: TextAlign.center,
                      style: kSemiBold.copyWith(
                        fontSize: SizeConfig.body1,
                        color: kDarkBlue,
                      ),
                    ),
                    Text(
                      'Products count',
                      textAlign: TextAlign.center,
                      style: kSemiBold.copyWith(
                        fontSize: SizeConfig.body1,
                        color: kDarkBlue,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      pageCount.toString(),
                      textAlign: TextAlign.center,
                      style: kBold.copyWith(
                        fontSize: SizeConfig.body2,
                        color: kDarkBlue,
                      ),
                    ),
                    Text(
                      productsCount.toString(),
                      textAlign: TextAlign.center,
                      style: kBold.copyWith(
                        fontSize: SizeConfig.body2,
                        color: kDarkBlue,
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
