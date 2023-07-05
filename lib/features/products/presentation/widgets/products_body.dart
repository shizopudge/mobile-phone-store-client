import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_store/core/utils/debouncer.dart';

import '../../../../core/presentation/widgets/buttons/go_top_button.dart';
import '../../../../core/presentation/widgets/cards/product/product_card.dart';
import '../../../../core/presentation/widgets/loading/casual_loader.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../domain/entities/product.dart';
import '../bloc/products_bloc.dart';
import '../pages/products_page.dart';
import 'products_app_bar.dart';
import 'products_filter.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({
    super.key,
  });

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  late final TextEditingController _searchController = TextEditingController()
    ..addListener(_searchListener);
  late final ScrollController _scrollController = ScrollController()
    ..addListener(_scrollListener);

  final Debouncer _debouncer = Debouncer(milliseconds: 1000);

  void _searchListener() {
    if (_searchController.text.isNotEmpty) {
      _debouncer.call(() => context
          .read<ProductsBloc>()
          .add(ProductsEvent.searchProducts(_searchController.text.trim())));
    }
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        context.read<ProductsBloc>().add(const ProductsEvent.getNextProducts());
      }
    }
    if (_scrollController.position.pixels > (SizeConfig.isMobile ? 50 : 150)) {
      context.read<ProductsScrollCubit>().setScrolled();
    } else {
      context.read<ProductsScrollCubit>().setNotScrolled();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductsBloc>().state;
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButtonLocation: SizeConfig.isMobile
          ? FloatingActionButtonLocation.centerFloat
          : FloatingActionButtonLocation.endFloat,
      floatingActionButton: context.watch<ProductsScrollCubit>().state
          ? GoTopButton(scrollController: _scrollController)
          : null,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            if (!state.isRefreshing) {
              context
                  .read<ProductsBloc>()
                  .add(const ProductsEvent.refreshProducts());
            }
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics()),
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                sliver: ProductsAppBar(
                  onFilter: () => showModalBottomSheet(
                    context: context,
                    elevation: 0,
                    backgroundColor: kLightWhite,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: (_) => ProductsFilterSheet(
                      context: context,
                      currentFilter: state.filter,
                    ),
                  ),
                  searchController: _searchController,
                ),
              ),
              SliverVisibility(
                visible: state.isRefreshing,
                sliver: const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  sliver: SliverToBoxAdapter(
                    child: CasualLoader(
                      color: kDarkBlue,
                    ),
                  ),
                ),
              ),
              SliverVisibility(
                visible: state.products.isEmpty && !state.isLoading,
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: SizeConfig.iconLarge,
                          color: kDarkBlue,
                        ),
                        Text(
                          'Nothing was found',
                          textAlign: TextAlign.center,
                          style: kBold.copyWith(
                              color: kDarkBlue, fontSize: SizeConfig.body2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGridView<Product>(
                  items: state.products,
                  child: (item) => ProductCard(item),
                ),
              ),
              SliverVisibility(
                visible: state.isPaginating,
                sliver: SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                          .copyWith(top: 30, bottom: 75),
                  sliver: const SliverToBoxAdapter(
                    child: CasualLoader(
                      color: kDarkBlue,
                    ),
                  ),
                ),
              ),
              SliverVisibility(
                visible: state.isLastPage,
                sliver: SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 30, bottom: 75),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'You have viewed all products that match your search',
                        textAlign: TextAlign.center,
                        style: kMedium.copyWith(
                          color: kDarkBlue,
                          fontSize: SizeConfig.body2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
