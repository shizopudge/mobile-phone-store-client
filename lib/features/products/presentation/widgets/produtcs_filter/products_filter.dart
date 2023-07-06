import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';

import '../../../../../core/constants/enums.dart';
import '../../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../../core/presentation/widgets/other/bottom_sheet_divider.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/utils/size_config.dart';
import '../../bloc/products_bloc.dart';
import 'products_filter_button.dart';
import 'products_filter_cost_interval_dialog.dart';
import 'products_filter_cost_slider.dart';
import 'products_filter_item.dart';

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

  void _onCostChange({
    required void Function(double minCost, double maxCost) callback,
    required BuildContext context,
    required String minCost,
    required String maxCost,
    required ProductsFilter filter,
  }) {
    final double min = minCost.isNotEmpty ? double.parse(minCost) : 0;
    final double max = maxCost.isNotEmpty ? double.parse(maxCost) : 99999;
    if (min <= max) {
      callback(min, max);
      Navigator.of(context).pop();
    } else {
      Flushbar(
        messageText: Text(
          'Min cost should be less then max',
          style: kMedium.copyWith(
            fontSize: SizeConfig.body3,
            color: kLightWhite,
          ),
        ),
        backgroundColor: kDarkBlue,
        flushbarPosition: FlushbarPosition.TOP,
        icon: Icon(
          Icons.input_rounded,
          size: SizeConfig.iconSmall,
          color: kRed,
        ),
        duration: const Duration(seconds: 3),
      ).show(context);
    }
  }

  void _showCostIntervalDialog({
    required BuildContext context,
    required ProductsFilter filter,
  }) =>
      showDialog(
        context: context,
        builder: (dialogContext) => Scaffold(
          backgroundColor: Colors.transparent,
          body: TapRegion(
            onTapOutside: (_) => Navigator.of(dialogContext).pop(),
            child: ProductsFilterCostIntervalDialog(
              minCost: filter.minCost,
              maxCost: filter.maxCost,
              onTap: (minCost, maxCost) => _onCostChange(
                callback: (min, max) => context
                    .read<ProductsFilterCubit>()
                    .changeFilter(filter.copyWith(minCost: min, maxCost: max)),
                context: dialogContext,
                minCost: minCost,
                maxCost: maxCost,
                filter: filter,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsFilterCubit>(
      create: (_) => ProductsFilterCubit()..init(currentFilter),
      child: BlocBuilder<ProductsFilterCubit, ProductsFilter>(
        builder: (context, filter) => Scaffold(
          backgroundColor: Colors.transparent,
          persistentFooterAlignment: AlignmentDirectional.bottomCenter,
          persistentFooterButtons: [
            CasualButton(
              onTap: () {
                productsContext
                    .read<ProductsBloc>()
                    .add(ProductsEvent.changeFilter(filter));
                Navigator.of(context).pop();
              },
              text: 'Apply filter',
              fontSize: SizeConfig.body2,
              isEnabled: true,
            ),
          ],
          body: Column(
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
                    ProductsFilterItem(
                      title: 'Filter',
                      action: Flexible(
                        child: TextButton(
                          onPressed: () {
                            productsContext.read<ProductsBloc>().add(
                                const ProductsEvent.changeFilter(
                                    ProductsFilter()));
                            Navigator.of(context).pop();
                          },
                          child: AutoSizeText(
                            'Reset',
                            overflow: TextOverflow.ellipsis,
                            style: kSemiBold.copyWith(
                                fontSize: SizeConfig.body2, color: kLightBlue),
                          ),
                        ),
                      ),
                    ),
                    ProductsFilterItem(
                      title: 'Sort by',
                      child: Row(
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
                    ),
                    ProductsFilterItem(
                      title: 'Options',
                      child: Row(
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
                    ),
                    ProductsFilterItem(
                      title: 'Limit',
                      child: Row(
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
                    ),
                    ProductsFilterItem(
                      title: 'Cost interval',
                      action: Flexible(
                        child: TextButton(
                          onPressed: () => _showCostIntervalDialog(
                              context: context, filter: filter),
                          child: AutoSizeText(
                            'Enter manually',
                            overflow: TextOverflow.ellipsis,
                            style: kSemiBold.copyWith(
                                fontSize: SizeConfig.body2, color: kLightBlue),
                          ),
                        ),
                      ),
                      showDivider: false,
                      child: ProductsFilterCostSlider(
                        minCost: filter.minCost,
                        maxCost: filter.maxCost,
                        onChange: (values) =>
                            context.read<ProductsFilterCubit>().changeFilter(
                                  filter.copyWith(
                                    minCost: values.start * 99999,
                                    maxCost: values.end * 99999,
                                  ),
                                ),
                      ),
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
    );
  }
}
