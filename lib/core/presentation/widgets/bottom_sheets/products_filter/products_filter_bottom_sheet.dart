import 'package:flutter/material.dart';

import '../../../../constants/enums.dart';
import '../../../../domain/entities/filters.dart';
import '../../../../failure/failure.dart';
import '../../../../utils/popup_utils.dart';
import '../../../../utils/size_config.dart';
import '../../../animations/fade_animation_x.dart';
import '../../../animations/fade_animation_y_down.dart';
import '../../../animations/fade_animation_y_up.dart';
import '../../buttons/casual_button.dart';
import '../../buttons/casual_text_button.dart';
import '../../other/bottom_sheet_divider.dart';
import 'widgets/products_filter_button.dart';
import 'widgets/products_filter_cost_interval_dialog.dart';
import 'widgets/products_filter_cost_slider.dart';
import 'widgets/products_filter_item.dart';

class ProductsFilterPage extends StatefulWidget {
  final void Function(ProductsFilter filter) onApply;
  final VoidCallback onReset;
  final ProductsFilter currentFilter;
  const ProductsFilterPage(
      {super.key,
      required this.currentFilter,
      required this.onApply,
      required this.onReset});

  @override
  State<ProductsFilterPage> createState() => _ProductsFilterPageState();
}

class _ProductsFilterPageState extends State<ProductsFilterPage> {
  late final ValueNotifier<ProductsFilter> _filter =
      ValueNotifier(widget.currentFilter);

  void _onCostChange({
    required BuildContext context,
    required void Function(double minCost, double maxCost) callback,
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
      PopupUtils.showFailureSnackBar(
          context: context,
          failure:
              const CasualFailure(message: 'Min cost should be less then max'));
    }
  }

  void _showCostIntervalDialog(
    ProductsFilter filter,
  ) =>
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
                callback: (min, max) =>
                    _filter.value = filter.copyWith(minCost: min, maxCost: max),
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
  void dispose() {
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ValueListenableBuilder(
      valueListenable: _filter,
      builder: (context, filter, _) => Column(
        children: [
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          const FadeAnimationYDown(delay: .1, child: BottomSheetDivider()),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.isMobile
                      ? SizeConfig.setPadding(20)
                      : SizeConfig.isTablet
                          ? SizeConfig.setPadding(30)
                          : SizeConfig.setPadding(45)),
              children: [
                FadeAnimationX(
                  delay: .15,
                  child: ProductsFilterItem(
                    title: 'Filter',
                    action: CasualTextButton(
                      onTap: () {
                        widget.onReset();
                        Navigator.of(context).pop();
                      },
                      text: 'Reset',
                    ),
                  ),
                ),
                FadeAnimationX(
                  delay: .2,
                  child: ProductsFilterItem(
                    title: 'Sort by',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ProductsFilterButton(
                            onTap: () => _filter.value =
                                filter.copyWith(sort: SortBy.asc),
                            isEnabled: filter.sort == SortBy.asc,
                            text: 'Asc',
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.setPadding(15),
                        ),
                        Expanded(
                          child: ProductsFilterButton(
                            onTap: () => _filter.value =
                                filter.copyWith(sort: SortBy.desc),
                            isEnabled: filter.sort == SortBy.desc,
                            text: 'Desc',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimationX(
                  delay: .25,
                  child: ProductsFilterItem(
                    title: 'Options',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ProductsFilterButton(
                            onTap: () => _filter.value = filter.copyWith(
                                newArrival: filter.newArrival ? false : true),
                            isEnabled: filter.newArrival,
                            text: 'New arrival',
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.setPadding(15),
                        ),
                        Expanded(
                          child: ProductsFilterButton(
                            onTap: () => _filter.value = filter.copyWith(
                                withDiscount:
                                    filter.withDiscount ? false : true),
                            isEnabled: filter.withDiscount,
                            text: 'With discount',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimationX(
                  delay: .3,
                  child: ProductsFilterItem(
                    title: 'Limit',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ProductsFilterButton(
                            onTap: () =>
                                _filter.value = filter.copyWith(limit: 10),
                            isEnabled: filter.limit == 10,
                            text: '10',
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.setPadding(15),
                        ),
                        Expanded(
                          child: ProductsFilterButton(
                            onTap: () =>
                                _filter.value = filter.copyWith(limit: 20),
                            isEnabled: filter.limit == 20,
                            text: '20',
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: ProductsFilterButton(
                            onTap: () =>
                                _filter.value = filter.copyWith(limit: 30),
                            isEnabled: filter.limit == 30,
                            text: '30',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimationX(
                  delay: .35,
                  child: ProductsFilterItem(
                    title: 'Cost interval',
                    action: CasualTextButton(
                      onTap: () => _showCostIntervalDialog(filter),
                      text: 'Enter manually',
                    ),
                    showDivider: false,
                    child: ProductsFilterCostSlider(
                      minCost: filter.minCost,
                      maxCost: filter.maxCost,
                      onChange: (values) => _filter.value = filter.copyWith(
                        minCost: values.start * 99999,
                        maxCost: values.end * 99999,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.setPadding(25),
                ),
              ],
            ),
          ),
          FadeAnimationYUp(
            delay: .4,
            child: CasualButton(
              onTap: () {
                widget.onApply(filter);
                Navigator.of(context).pop();
              },
              text: 'Apply filter',
              fontSize: SizeConfig.body2,
              isEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
