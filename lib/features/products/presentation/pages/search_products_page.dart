import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/go_top_button.dart';
import '../../../../core/presentation/widgets/loading/casual_loader.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/presentation/widgets/text_fields/search_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../../core/utils/size_config.dart';
import '../../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../../detailed_product/presentation/pages/detailed_product_page.dart';
import '../bloc/products_bloc.dart';
import '../widgets/product_card/product_card.dart';
import 'products_filter_page.dart';

class SearchProductsPage extends StatefulWidget {
  const SearchProductsPage({super.key});

  @override
  State<SearchProductsPage> createState() => _SearchProductsPageState();
}

class _SearchProductsPageState extends State<SearchProductsPage> {
  late final TextEditingController _searchController = TextEditingController()
    ..addListener(_searchListener);
  late final ScrollController _scrollController = ScrollController()
    ..addListener(_scrollListener);
  final ValueNotifier<bool> _isScrolled = ValueNotifier<bool>(false);

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
      _isScrolled.value = true;
    } else {
      _isScrolled.value = false;
    }
  }

  void onClearTap(BuildContext context) {
    _searchController.clear();
    context.read<ProductsBloc>().add(const ProductsEvent.searchProducts(''));
  }

  void onFilterTap(
          {required BuildContext context, required ProductsFilter filter}) =>
      showModalBottomSheet(
        context: context,
        constraints: const BoxConstraints.expand(),
        backgroundColor: kLightWhite,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (_) => ProductsFilterPage(
          context: context,
          currentFilter: filter,
        ),
      );

  void goTop() => _scrollController.animateTo(0,
      duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductsBloc, ProductsState>(
          listenWhen: (previous, current) => current.isFailure,
          listener: (context, state) {
            if (state.isFailure) {
              PopupUtils.showFailureSnackBar(
                  context: context, failure: state.failure);
            }
          },
        ),
        BlocListener<DetailedProductBloc, DetailedProductState>(
          listenWhen: (previous, current) => current.product != null,
          listener: (context, state) {
            if (state.product != null &&
                ModalRoute.of(context)?.isCurrent == true) {
              Navigator.of(context).pushNamed(DetailedProductPage.path);
            }
          },
        ),
      ],
      child: ValueListenableBuilder(
        valueListenable: _isScrolled,
        builder: (context, isScrolled, _) => Scaffold(
          backgroundColor: kWhite,
          floatingActionButtonLocation: SizeConfig.isMobile
              ? FloatingActionButtonLocation.centerFloat
              : FloatingActionButtonLocation.endFloat,
          floatingActionButton: isScrolled
              ? FadeAnimationYDown(
                  delay: .1,
                  child: GoTopButton(
                    onTap: goTop,
                  ),
                )
              : null,
          body: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                    if (!state.isRefreshing) {
                      context
                          .read<ProductsBloc>()
                          .add(const ProductsEvent.refreshProducts());
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.setPadding(20)),
                    child: CustomScrollView(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: ClampingScrollPhysics()),
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.setPadding(20)),
                          sliver: SliverToBoxAdapter(
                            child: FadeAnimationYDown(
                              delay: .4,
                              child: SearchField(
                                searchController: _searchController,
                                showClose: state.filter.query.isNotEmpty,
                                onClear: () => onClearTap(context),
                                onFilter: () => onFilterTap(
                                    context: context, filter: state.filter),
                              ),
                            ),
                          ),
                        ),
                        if (state.isRefreshing)
                          SliverPadding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.setPadding(20)),
                            sliver: const SliverToBoxAdapter(
                              child: FadeAnimationYDown(
                                delay: .1,
                                child: CasualLoader(
                                  color: kDarkBlue,
                                ),
                              ),
                            ),
                          ),
                        if (state.products.isEmpty && !state.isLoading)
                          SliverToBoxAdapter(
                            child: Center(
                              child: FadeAnimationYDown(
                                delay: .1,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.search_off_rounded,
                                      size: SizeConfig.iconLarger,
                                      color: kDarkBlue,
                                    ),
                                    Text(
                                      'Nothing was found',
                                      textAlign: TextAlign.center,
                                      style: kBold.copyWith(
                                          color: kDarkBlue,
                                          fontSize: SizeConfig.body1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (state.isLoading)
                          const SliverFillRemaining(
                            child: Center(
                              child: FadeAnimationYDown(
                                delay: .1,
                                child: CasualLoader(
                                  color: kDarkBlue,
                                ),
                              ),
                            ),
                          )
                        else
                          SliverGridView<Product>(
                            items: state.products,
                            child: (product, index) => FadeAnimationX(
                              delay: index * .025,
                              child: ProductCard(
                                onTap: () => context
                                    .read<DetailedProductBloc>()
                                    .add(DetailedProductEvent.changeProduct(
                                        product)),
                                product: product,
                              ),
                            ),
                          ),
                        if (state.isPaginating)
                          SliverPadding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.setPadding(30),
                                bottom: SizeConfig.setPadding(75)),
                            sliver: const SliverToBoxAdapter(
                              child: FadeAnimationYDown(
                                delay: .1,
                                child: CasualLoader(
                                  color: kDarkBlue,
                                ),
                              ),
                            ),
                          ),
                        if (state.isLastPage)
                          SliverPadding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.setPadding(20),
                                bottom:
                                    SizeConfig.setPadding(SizeConfig.isMobile
                                        ? 75
                                        : SizeConfig.isTablet
                                            ? 60
                                            : 50)),
                            sliver: SliverToBoxAdapter(
                              child: Center(
                                child: FadeAnimationYDown(
                                  delay: .5,
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
            },
          ),
        ),
      ),
    );
  }
}
