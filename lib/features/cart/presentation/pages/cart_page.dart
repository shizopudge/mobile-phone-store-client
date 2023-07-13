import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/animations/fade_animation_y_up.dart';
import '../../../../core/presentation/widgets/bottom_sheets/products_filter/products_filter_bottom_sheet.dart';
import '../../../../core/presentation/widgets/cards/rectangle_product_card.dart';
import '../../../../core/presentation/widgets/cards/square_product_card.dart';
import '../../../../core/presentation/widgets/other/casual_dismissible.dart';
import '../../../../core/presentation/widgets/pages/products_page.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../../core/utils/size_config.dart';
import '../../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_info.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListPage<CartBloc, CartEvent, CartState>(
                onSearch: (query) => context.read<CartBloc>().add(
                      CartEvent.searchProducts(
                        query,
                      ),
                    ),
                onPagination: () => context
                    .read<CartBloc>()
                    .add(const CartEvent.getNextProducts()),
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
                          .read<CartBloc>()
                          .add(CartEvent.changeFilter(newFilter)),
                      onReset: () => context
                          .read<CartBloc>()
                          .add(const CartEvent.changeFilter(ProductsFilter())),
                      currentFilter: state.filter,
                    ),
                  );
                },
                onRefresh: () => context.read<CartBloc>().add(
                      const CartEvent.refresh(),
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
                query: state.filter.query,
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
                            child: CasualDismissible(
                              onDismiss: (direction) => context
                                  .read<CartBloc>()
                                  .add(CartEvent.toggleCart(product)),
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
                          delay: index * .025,
                          child: CasualDismissible(
                            onDismiss: (direction) => context
                                .read<CartBloc>()
                                .add(CartEvent.toggleCart(product)),
                            child: SquareProductCard(
                              onTap: () => context
                                  .read<DetailedProductBloc>()
                                  .add(DetailedProductEvent.changeProduct(
                                      product)),
                              product: product,
                              withHero: false,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            FadeAnimationYUp(
              delay: .3,
              child: CartInfo(
                totalCost: state.totalCost,
                productsCount: state.products.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
