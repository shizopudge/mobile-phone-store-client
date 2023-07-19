import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../buttons/casual_button.dart';

import '../../../../features/detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../../domain/entities/purchase.dart';
import '../../../styles/styles.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/size_config.dart';
import '../buttons/casual_text_button.dart';

class PurchaseCard extends StatelessWidget {
  final VoidCallback onCancelTap;
  final Purchase purchase;
  const PurchaseCard({
    super.key,
    required this.onCancelTap,
    required this.purchase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        SizeConfig.setPadding(15),
      ),
      margin: EdgeInsets.only(bottom: SizeConfig.setPadding(25)),
      decoration: BoxDecoration(
        color: kLightWhite,
        borderRadius: BorderRadius.circular(
          SizeConfig.borderRadiusSmall,
        ),
        boxShadow: [
          BoxShadow(
              color: kGrey.withOpacity(.75),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3)),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ID: ',
                style: kSemiBold.copyWith(
                  color: kDarkBlue,
                  fontSize: SizeConfig.body2,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    purchase.id,
                    style: kMedium.copyWith(
                      color: kLightBlue,
                      fontSize: SizeConfig.body3,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.setPadding(8)),
          RichText(
            text: TextSpan(
              text: 'Status: ',
              style: kSemiBold.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
              children: [
                TextSpan(
                  text: purchase.status.toString(),
                  style: kSemiBold.copyWith(
                    color: kLightBlue,
                    fontSize: SizeConfig.body3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.setPadding(8)),
          RichText(
            text: TextSpan(
              text: 'Created at: ',
              style: kSemiBold.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
              children: [
                TextSpan(
                  text: DateFormat('yyyy-MM-dd HH:mm')
                      .format(DateTime.parse(purchase.createdAt)),
                  style: kSemiBold.copyWith(
                    color: kLightBlue,
                    fontSize: SizeConfig.body3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.setPadding(8)),
          RichText(
            text: TextSpan(
              text: 'Last update: ',
              style: kSemiBold.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
              children: [
                TextSpan(
                  text: DateFormat('yyyy-MM-dd HH:mm')
                      .format(DateTime.parse(purchase.updatedAt)),
                  style: kSemiBold.copyWith(
                    color: kLightBlue,
                    fontSize: SizeConfig.body3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.setPadding(8)),
          RichText(
            text: TextSpan(
              text: 'Products count: ',
              style: kSemiBold.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
              children: [
                TextSpan(
                  text: purchase.products.length.toString(),
                  style: kSemiBold.copyWith(
                    color: kLightBlue,
                    fontSize: SizeConfig.body3,
                  ),
                ),
              ],
            ),
          ),
          if (purchase.status.isShipped || purchase.status.isDelivered)
            SizedBox(height: SizeConfig.setPadding(8)),
          if (purchase.status.isShipped || purchase.status.isDelivered)
            RichText(
              text: TextSpan(
                text: 'Tracking link: ',
                style: kSemiBold.copyWith(
                  color: kDarkBlue,
                  fontSize: SizeConfig.body2,
                ),
                children: [
                  TextSpan(
                    text:
                        'https://tracking-site/mobile-store-kurmantaev/${purchase.id}',
                    style: kSemiBold.copyWith(
                      color: kLightBlue,
                      fontSize: SizeConfig.body3,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async =>
                          await Clipboard.setData(ClipboardData(
                                  text:
                                      'https://tracking-site/mobile-store-kurmantaev/${purchase.id}'))
                              .whenComplete(
                            () => PopupUtils.showSnackBar(
                              context: context,
                              text: 'Link copied to clipboard',
                            ),
                          ),
                  ),
                ],
              ),
            ),
          SizedBox(height: SizeConfig.setPadding(8)),
          RichText(
            text: TextSpan(
              text: 'Cost: ',
              style: kSemiBold.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
              children: [
                TextSpan(
                  text: purchase.cost.toString(),
                  style: kSemiBold.copyWith(
                    color: kLightBlue,
                    fontSize: SizeConfig.body3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.setPadding(8)),
          RichText(
            text: TextSpan(
              text: 'Currency: ',
              style: kSemiBold.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
              children: [
                TextSpan(
                  text: purchase.currency,
                  style: kSemiBold.copyWith(
                    color: kLightBlue,
                    fontSize: SizeConfig.body3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.setPadding(8)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Products: ',
                style: kSemiBold.copyWith(
                  color: kDarkBlue,
                  fontSize: SizeConfig.body2,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    purchase.products.length,
                    (index) => CasualTextButton(
                      onTap: () => context.read<DetailedProductBloc>().add(
                          DetailedProductEvent.changeProduct(
                              purchase.products[index])),
                      text: purchase.products[index].title,
                      fontSize: SizeConfig.body2,
                    ),
                  ),
                ),
              ),
              if (!purchase.status.isCancelled)
                SizedBox(height: SizeConfig.setPadding(8)),
              if (!purchase.status.isCancelled)
                CasualButton(
                  onTap: onCancelTap,
                  text: 'Cancel',
                  fontSize: SizeConfig.body2,
                  height: SizeConfig.isMobile
                      ? SizeConfig.screenWidth! * .12
                      : SizeConfig.isTablet
                          ? SizeConfig.screenWidth! * .08
                          : SizeConfig.screenWidth! * .06,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
