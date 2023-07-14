import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/presentation/widgets/other/casual_dropdown_menu.dart';
import '../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/create_edit_model_bloc.dart';

class CreateEditModelBody extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController pixelDensityController;
  final TextEditingController screenRefreshRateController;
  final TextEditingController screenDiagonalController;
  final TextEditingController weightController;
  final TextEditingController widthController;
  final TextEditingController heightController;
  const CreateEditModelBody({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.pixelDensityController,
    required this.screenRefreshRateController,
    required this.screenDiagonalController,
    required this.weightController,
    required this.widthController,
    required this.heightController,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateEditModelBloc>().state;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  CasualTextField(
                    controller: nameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z ]'))
                    ],
                    labelStyle: kSemiBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.h3),
                    label: 'Model name',
                    hintText: 'Model name',
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  CasualTextField(
                    controller: descriptionController,
                    labelStyle: kSemiBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.h3),
                    label: 'Description',
                    hintText: 'Description',
                    maxLines: 5,
                    maxLength: 1500,
                    counterStyle: kSemiBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.body3),
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Operating system',
                            style: kBold.copyWith(
                                color: kDarkBlue, fontSize: SizeConfig.body1),
                          ),
                          SizedBox(
                            height: SizeConfig.setPadding(20),
                          ),
                          Center(
                            child: CasualDropdownMenu<OperatingSystem>(
                              currValue: state.operatingSystem,
                              values: List.generate(
                                OperatingSystem.values.length,
                                (index) => DropdownMenuItem(
                                  value: OperatingSystem.values[index],
                                  child: Text(
                                    OperatingSystem.values[index].toString(),
                                    style: kBold.copyWith(
                                        color: kDarkBlue,
                                        fontSize: SizeConfig.body1),
                                  ),
                                ),
                              ),
                              onChange: (newOperatingSystem) {
                                if (newOperatingSystem != null) {
                                  context.read<CreateEditModelBloc>().add(
                                      CreateEditModelEvent
                                          .changeOperatingSystem(
                                              newOperatingSystem));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Display type',
                            style: kBold.copyWith(
                                color: kDarkBlue, fontSize: SizeConfig.body1),
                          ),
                          SizedBox(
                            height: SizeConfig.setPadding(20),
                          ),
                          Center(
                            child: CasualDropdownMenu<DisplayType>(
                              currValue: state.displayType,
                              values: List.generate(
                                DisplayType.values.length,
                                (index) => DropdownMenuItem(
                                  value: DisplayType.values[index],
                                  child: Text(
                                    DisplayType.values[index].toString(),
                                    style: kBold.copyWith(
                                        color: kDarkBlue,
                                        fontSize: SizeConfig.body1),
                                  ),
                                ),
                              ),
                              onChange: (newDisplayType) {
                                if (newDisplayType != null) {
                                  context.read<CreateEditModelBloc>().add(
                                      CreateEditModelEvent.changeDisplayType(
                                          newDisplayType));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  CasualTextField(
                    controller: pixelDensityController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                        RegExp('[ ]'),
                      ),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    labelStyle: kSemiBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.h3),
                    label: 'Pixel density',
                    hintText: 'Pixel density',
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  CasualTextField(
                    controller: screenRefreshRateController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                        RegExp('[ ]'),
                      ),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    labelStyle: kSemiBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.h3),
                    label: 'Screen refresh rate',
                    hintText: 'Screen refresh rate',
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  CasualTextField(
                    controller: screenDiagonalController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                        RegExp('[ ]'),
                      ),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))
                    ],
                    labelStyle: kSemiBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.h3),
                    label: 'Screen Diagonal',
                    hintText: 'Screen Diagonal',
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  CasualTextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                        RegExp('[ ]'),
                      ),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    labelStyle: kSemiBold.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.h3),
                    label: 'Weight',
                    hintText: 'Weight',
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(20),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: CasualTextField(
                          controller: widthController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[ ]'),
                            ),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          labelStyle: kSemiBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.h3),
                          label: 'Width',
                          hintText: 'Width',
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.setPadding(8),
                      ),
                      Flexible(
                        child: CasualTextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[ ]'),
                            ),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          labelStyle: kSemiBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.h3),
                          label: 'Height',
                          hintText: 'Height',
                        ),
                      ),
                    ],
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
