import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/cards/rectangle_product_card.dart';
import '../../../../core/presentation/widgets/cards/square_product_card.dart';
import '../../../../core/presentation/widgets/pages/products_page.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../../core/utils/size_config.dart';
import '../../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../bloc/wishlist_bloc.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return ProductsPage<WishlistBloc, WishlistEvent, WishlistState>(
          onSearch: (query) => context.read<WishlistBloc>().add(
                WishlistEvent.searchProducts(
                  query,
                ),
              ),
          onPagination: () => context
              .read<WishlistBloc>()
              .add(const WishlistEvent.getNextProducts()),
          onFilterChange: (newFilter) => context
              .read<WishlistBloc>()
              .add(WishlistEvent.changeFilter(newFilter)),
          onRefresh: () => context.read<WishlistBloc>().add(
                const WishlistEvent.refreshProducts(),
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
          child: SizeConfig.isMobile
              ? SliverList.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final Product product = state.products[index];
                    return FadeAnimationX(
                      delay: index * .025,
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) => context
                            .read<WishlistBloc>()
                            .add(WishlistEvent.toggleWishlist(product)),
                        child: RectangleProductCard(
                            onTap: () => context
                                .read<DetailedProductBloc>()
                                .add(DetailedProductEvent.changeProduct(
                                    product)),
                            product: product),
                      ),
                    );
                  },
                )
              : SliverGridView<Product>(
                  items: state.products,
                  child: (product, index) => FadeAnimationX(
                    key: UniqueKey(),
                    delay: index * .025,
                    child: SquareProductCard(
                      onTap: () => context
                          .read<DetailedProductBloc>()
                          .add(DetailedProductEvent.changeProduct(product)),
                      product: product,
                      withHero: false,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
