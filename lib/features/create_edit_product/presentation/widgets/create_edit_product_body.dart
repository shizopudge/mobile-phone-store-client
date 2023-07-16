import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/constants/extensions.dart';
import '../../../../core/presentation/widgets/buttons/casual_text_button.dart';
import '../../../../core/presentation/widgets/other/color_container.dart';
import '../../../../core/presentation/widgets/scrollable/simple_slider.dart';
import '../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../core/styles/styles.dart';
import '../bloc/create_edit_product_bloc.dart';

import '../../../../core/utils/size_config.dart';

class CreateEditProductBody extends StatelessWidget {
  final VoidCallback onUploadImagesTap;
  final void Function(File image) onUploadedImageTap;
  final void Function(String imageLink) onImageTap;
  final VoidCallback onColorPickerTap;
  final TextEditingController costController;
  final TextEditingController storageController;
  final TextEditingController colorController;
  final TextEditingController inStockCountController;
  final TextEditingController discountController;
  const CreateEditProductBody({
    super.key,
    required this.onUploadImagesTap,
    required this.onUploadedImageTap,
    required this.onImageTap,
    required this.onColorPickerTap,
    required this.costController,
    required this.storageController,
    required this.colorController,
    required this.inStockCountController,
    required this.discountController,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateEditProductBloc>().state;
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
                  if (state.hasImages)
                    SizedBox(
                      height: SizeConfig.isMobile
                          ? SizeConfig.screenWidth! * .75
                          : SizeConfig.isTablet
                              ? SizeConfig.screenWidth! * .5
                              : SizeConfig.screenWidth! * .25,
                      child: SimpleSlider(
                        itemCount:
                            state.images.length + state.productImagesLength,
                        bottomActiveButtonColor: kDarkBlue,
                        itemBuilder: (index) {
                          if (kIsWeb) {
                            if (index < state.productImagesLength) {
                              return GestureDetector(
                                onTap: () => onImageTap(
                                    state.product?.images[index] ?? ''),
                                child: Image(
                                  image: NetworkImage(
                                      '${ApiConstants.imagesUrl}/${state.product?.images[index]}'),
                                  fit: BoxFit.contain,
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () => onUploadedImageTap(
                                  File(state.images[index].path)),
                              child: Image(
                                image: NetworkImage(state
                                    .images[index - state.productImagesLength]
                                    .path),
                                fit: BoxFit.contain,
                              ),
                            );
                          } else {
                            if (index < state.productImagesLength) {
                              return GestureDetector(
                                onTap: () => onImageTap(
                                    state.product?.images[index] ?? ''),
                                child: Image(
                                  image: NetworkImage(
                                      '${ApiConstants.imagesUrl}/${state.product?.images[index]}'),
                                  fit: BoxFit.contain,
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () => onUploadedImageTap(
                                  File(state.images[index].path)),
                              child: Image(
                                image: FileImage(
                                  state.images[
                                      index - state.productImagesLength],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  SizedBox(
                    height: SizeConfig.setPadding(10),
                  ),
                  CasualTextButton(
                    onTap: onUploadImagesTap,
                    text: 'Upload images',
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CasualTextField(
                          controller: costController,
                          hintText: 'Cost',
                          labelStyle: kSemiBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.h3),
                          label: 'Cost',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[ ]'),
                            ),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9\.]'))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.setPadding(8),
                      ),
                      Icon(
                        Icons.attach_money_rounded,
                        color: kLightBlue,
                        size: SizeConfig.iconMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CasualTextField(
                          controller: storageController,
                          hintText: 'Storage GB',
                          labelStyle: kSemiBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.h3),
                          label: 'Storage',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[ ]'),
                            ),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.setPadding(8),
                      ),
                      Icon(
                        Icons.storage_rounded,
                        color: kLightBlue,
                        size: SizeConfig.iconMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CasualTextField(
                          controller: inStockCountController,
                          hintText: 'In stock count',
                          labelStyle: kSemiBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.h3),
                          label: 'In stock count',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[ ]'),
                            ),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.setPadding(8),
                      ),
                      Icon(
                        Icons.onetwothree_rounded,
                        color: kLightBlue,
                        size: SizeConfig.iconMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CasualTextField(
                          controller: discountController,
                          hintText: 'Discount',
                          labelStyle: kSemiBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.h3),
                          label: 'Discount',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[ ]'),
                            ),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.setPadding(8),
                      ),
                      Icon(
                        Icons.percent_rounded,
                        color: kLightBlue,
                        size: SizeConfig.iconMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CasualTextField(
                          controller: colorController,
                          hintText: 'Color',
                          labelStyle: kSemiBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.h3),
                          label: 'Color',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z ]'))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.setPadding(8),
                      ),
                      Icon(
                        Icons.color_lens_rounded,
                        color: kLightBlue,
                        size: SizeConfig.iconMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  if (state.colorCode.isNotEmpty)
                    GestureDetector(
                      onTap: onColorPickerTap,
                      child: ColorContainer(
                        color: HexColor.fromHex(state.colorCode),
                        height: SizeConfig.screenWidth! * .1,
                      ),
                    )
                  else
                    CasualTextButton(
                      onTap: onColorPickerTap,
                      text: 'Pick color',
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
