import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/bottom_sheets/products_filter/products_filter_bottom_sheet.dart';
import '../../../../core/presentation/widgets/cards/square_product_card.dart';
import '../../../../core/presentation/widgets/pages/browse_page.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../../detailed_product/presentation/pages/detailed_product_page.dart';
import '../bloc/browse_products_bloc.dart';

class BrowseProductsPage extends StatelessWidget {
  const BrowseProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<BrowseProductsBloc, BrowseProductsState>(
      listenWhen: (previous, current) => current.isFailure,
      listener: (context, state) {
        if (state.isFailure) {
          state.failure.call(context);
        }
      },
      builder: (context, state) {
        return BrowsePage<BrowseProductsBloc, BrowseProductsEvent,
            BrowseProductsState>(
          onSearch: (query) => context.read<BrowseProductsBloc>().add(
                BrowseProductsEvent.searchProducts(
                  query,
                ),
              ),
          onPagination: () => context
              .read<BrowseProductsBloc>()
              .add(const BrowseProductsEvent.getNextProducts()),
          onFilterTap: () {
            primaryFocus?.unfocus();
            showModalBottomSheet(
              context: context,
              constraints: const BoxConstraints.expand(),
              backgroundColor: kLightWhite,
              useSafeArea: true,
              isScrollControlled: true,
              builder: (_) => ProductsFilterPage(
                onApply: (newFilter) => context
                    .read<BrowseProductsBloc>()
                    .add(BrowseProductsEvent.changeFilter(newFilter)),
                onReset: () => context.read<BrowseProductsBloc>().add(
                    const BrowseProductsEvent.changeFilter(ProductsFilter())),
                currentFilter: state.filter,
              ),
            );
          },
          onRefresh: () => context.read<BrowseProductsBloc>().add(
                const BrowseProductsEvent.refresh(),
              ),
          listeners: [
            BlocListener<DetailedProductBloc, DetailedProductState>(
              listenWhen: (previous, current) => current.product != null,
              listener: (context, state) {
                if (state.product != null &&
                    ModalRoute.of(context)?.isCurrent == true) {
                  primaryFocus?.unfocus();
                  Navigator.of(context).pushNamed(DetailedProductPage.path);
                }
              },
            ),
          ],
          query: state.filter.query,
          searchInfo: state.info,
          isFilterActive: state.isFilterActive,
          isRefreshing: state.isRefreshing,
          isPaginating: state.isPaginating,
          isLoading: state.isLoading,
          isLastPage: state.isLastPage,
          isNothingFound: state.isNothingFound,
          child: SliverGridView<Product>(
            items: state.products,
            child: (product, index) => FadeAnimationX(
              delay: index * .025,
              child: SquareProductCard(
                key: UniqueKey(),
                onTap: () => context
                    .read<DetailedProductBloc>()
                    .add(DetailedProductEvent.changeProduct(product)),
                product: product,
              ),
            ),
          ),
        );
      },
    );
  }
}
