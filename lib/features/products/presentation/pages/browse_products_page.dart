import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/cards/square_product_card.dart';
import '../../../../core/presentation/widgets/pages/products_page.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../../core/utils/size_config.dart';
import '../../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../bloc/browse_products_bloc.dart';

class BrowseProductsPage extends StatelessWidget {
  const BrowseProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<SearchProductsBloc, BrowseProductsState>(
      builder: (context, state) {
        return ProductsPage<SearchProductsBloc, BrowseProductsEvent,
            BrowseProductsState>(
          onSearch: (query) => context.read<SearchProductsBloc>().add(
                BrowseProductsEvent.searchProducts(
                  query,
                ),
              ),
          onPagination: () => context
              .read<SearchProductsBloc>()
              .add(const BrowseProductsEvent.getNextProducts()),
          onFilterChange: (newFilter) => context
              .read<SearchProductsBloc>()
              .add(BrowseProductsEvent.changeFilter(newFilter)),
          onRefresh: () => context.read<SearchProductsBloc>().add(
                const BrowseProductsEvent.refreshProducts(),
              ),
          listener: BlocListener(
            listenWhen: (previous, current) => current.isFailure,
            listener: (context, state) {
              if (state.isFailure) {
                PopupUtils.showFailureSnackBar(
                    context: context, failure: state.failure);
              }
            },
          ),
          currentFIlter: state.filter,
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
