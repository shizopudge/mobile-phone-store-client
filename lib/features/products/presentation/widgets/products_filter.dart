import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_store/core/presentation/widgets/other/casual_dialog.dart';
import 'package:phone_store/core/presentation/widgets/text_fields/casual_text_field.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/products_bloc.dart';

class ProductsFilterCubit extends Cubit<ProductsFilter> {
  ProductsFilterCubit() : super(const ProductsFilter());

  void init(ProductsFilter filter) => emit(filter);

  void changeFilter(ProductsFilter filter) => emit(filter);
}

class ProductsFilterSheet extends StatelessWidget {
  final BuildContext productsContext;
  final ProductsFilter currentFilter;
  const ProductsFilterSheet(
      {super.key, required BuildContext context, required this.currentFilter})
      : productsContext = context;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1.2,
            sigmaY: 1.2,
          ),
          child: const SizedBox.expand(),
        ),
        BlocProvider<ProductsFilterCubit>(
          create: (_) => ProductsFilterCubit()..init(currentFilter),
          child: BlocBuilder<ProductsFilterCubit, ProductsFilter>(
            builder: (context, filter) => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const BottomSheetDivider(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.isMobile ? 20 : 40),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filter',
                            style: kSemiBold.copyWith(
                                fontSize: SizeConfig.body1, color: kDarkBlue),
                          ),
                          TextButton(
                            onPressed: () {
                              productsContext.read<ProductsBloc>().add(
                                  const ProductsEvent.changeFilter(
                                      ProductsFilter()));
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Reset',
                              style: kSemiBold.copyWith(
                                  fontSize: SizeConfig.body2,
                                  color: kLightBlue),
                            ),
                          ),
                        ],
                      ),
                      const ProductsFilterDivider(),
                      Text(
                        'Sort by',
                        style: kSemiBold.copyWith(
                            fontSize: SizeConfig.body1, color: kDarkBlue),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ProductsFilterButton(
                              onTap: () => context
                                  .read<ProductsFilterCubit>()
                                  .changeFilter(
                                      filter.copyWith(sort: SortBy.asc)),
                              isEnabled: filter.sort == SortBy.asc,
                              text: 'Asc',
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ProductsFilterButton(
                              onTap: () => context
                                  .read<ProductsFilterCubit>()
                                  .changeFilter(
                                      filter.copyWith(sort: SortBy.desc)),
                              isEnabled: filter.sort == SortBy.desc,
                              text: 'Desc',
                            ),
                          ),
                        ],
                      ),
                      const ProductsFilterDivider(),
                      Text(
                        'Options',
                        style: kSemiBold.copyWith(
                            fontSize: SizeConfig.body1, color: kDarkBlue),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ProductsFilterButton(
                              onTap: () => context
                                  .read<ProductsFilterCubit>()
                                  .changeFilter(filter.copyWith(
                                      newArrival:
                                          filter.newArrival ? false : true)),
                              isEnabled: filter.newArrival,
                              text: 'New arrival',
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ProductsFilterButton(
                              onTap: () => context
                                  .read<ProductsFilterCubit>()
                                  .changeFilter(filter.copyWith(
                                      withDiscount:
                                          filter.withDiscount ? false : true)),
                              isEnabled: filter.withDiscount,
                              text: 'With discount',
                            ),
                          ),
                        ],
                      ),
                      const ProductsFilterDivider(),
                      Text(
                        'Limit',
                        style: kSemiBold.copyWith(
                            fontSize: SizeConfig.body1, color: kDarkBlue),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ProductsFilterButton(
                              onTap: () => context
                                  .read<ProductsFilterCubit>()
                                  .changeFilter(filter.copyWith(limit: 10)),
                              isEnabled: filter.limit == 10,
                              text: '10',
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ProductsFilterButton(
                              onTap: () => context
                                  .read<ProductsFilterCubit>()
                                  .changeFilter(filter.copyWith(limit: 20)),
                              isEnabled: filter.limit == 20,
                              text: '20',
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ProductsFilterButton(
                              onTap: () => context
                                  .read<ProductsFilterCubit>()
                                  .changeFilter(filter.copyWith(limit: 30)),
                              isEnabled: filter.limit == 30,
                              text: '30',
                            ),
                          ),
                        ],
                      ),
                      const ProductsFilterDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cost interval',
                            style: kSemiBold.copyWith(
                                fontSize: SizeConfig.body1, color: kDarkBlue),
                          ),
                          TextButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (_) => CostIntervalDialog(
                                minCost: filter.minCost,
                                maxCost: filter.maxCost,
                                onMinCostChange: (minCost) => context
                                    .read<ProductsFilterCubit>()
                                    .changeFilter(filter.copyWith(
                                        minCost: double.parse(minCost))),
                                onMaxCostChange: (maxCost) => context
                                    .read<ProductsFilterCubit>()
                                    .changeFilter(filter.copyWith(
                                        maxCost: double.parse(maxCost))),
                              ),
                            ),
                            child: Text(
                              'Enter manually',
                              style: kSemiBold.copyWith(
                                  fontSize: SizeConfig.body2,
                                  color: kLightBlue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CostSlider(
                        minCost: filter.minCost,
                        maxCost: filter.maxCost,
                        onChange: (values) =>
                            context.read<ProductsFilterCubit>().changeFilter(
                                  filter.copyWith(
                                    minCost: values.start * 100000,
                                    maxCost: values.end * 100000,
                                  ),
                                ),
                      ),
                      const ProductsFilterDivider(),
                      CasualButton(
                        onTap: () {
                          productsContext
                              .read<ProductsBloc>()
                              .add(ProductsEvent.changeFilter(filter));
                          Navigator.of(context).pop();
                        },
                        text: 'Apply filter',
                        fontSize: SizeConfig.body2,
                        height: 45,
                        isEnabled: true,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CostIntervalDialog extends StatelessWidget {
  final void Function(String maxCost) onMinCostChange;
  final void Function(String maxCost) onMaxCostChange;
  final double? minCost;
  final double? maxCost;
  const CostIntervalDialog({
    super.key,
    required this.onMinCostChange,
    required this.onMaxCostChange,
    required this.minCost,
    required this.maxCost,
  });

  @override
  Widget build(BuildContext context) {
    return CasualDialog(
      title: 'Cost interval',
      subtitle: 'Enter cost interval manually',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CasualTextField(
            controller: TextEditingController(
                text:
                    minCost != null ? '\$${minCost!.toStringAsFixed(0)}' : '0'),
            hintText: 'Min cost',
            label: 'Min',
            labelStyle: kRegular.copyWith(
              color: kDarkBlue,
              fontSize: SizeConfig.body2,
            ),
            onChange: onMinCostChange,
          ),
          const SizedBox(
            height: 4,
          ),
          CasualTextField(
            controller: TextEditingController(
                text: maxCost != null
                    ? '\$${maxCost!.toStringAsFixed(0)}'
                    : 'Max'),
            hintText: 'Max cost',
            label: 'Max',
            labelStyle: kRegular.copyWith(
              color: kDarkBlue,
              fontSize: SizeConfig.body2,
            ),
            onChange: onMaxCostChange,
          ),
          const SizedBox(
            height: 12,
          ),
          CasualButton(
            onTap: () => Navigator.of(context).pop(),
            text: 'Enter',
            fontSize: SizeConfig.body2,
          )
        ],
      ),
    );
  }
}

class CostSlider extends StatelessWidget {
  final double? minCost;
  final double? maxCost;
  final void Function(RangeValues value) onChange;
  const CostSlider({
    super.key,
    required this.minCost,
    required this.maxCost,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
            values: RangeValues(
              minCost != null ? minCost! / 100000 : 0,
              maxCost != null ? maxCost! / 100000 : 1,
            ),
            onChanged: onChange),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              minCost != null ? '\$${minCost!.toStringAsFixed(0)}' : '\$0',
              style: kMedium.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
            ),
            Text(
              maxCost != null ? '\$${maxCost!.toStringAsFixed(0)}' : 'Max',
              style: kMedium.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProductsFilterDivider extends StatelessWidget {
  const ProductsFilterDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 1,
          color: kGrey,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 6,
        width: SizeConfig.screenWidth! * .18,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: kLightBlue,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductsFilterButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isEnabled;
  final String text;
  const ProductsFilterButton({
    super.key,
    required this.onTap,
    required this.isEnabled,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadius,
          ),
          border: Border.all(
            width: 1.2,
            color: kGrey,
          ),
          color: isEnabled ? kOrange : Colors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:
                kRegular.copyWith(fontSize: SizeConfig.body2, color: kDarkBlue),
          ),
        ),
      ),
    );
  }
}
