import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/go_top_button.dart';
import '../../../../core/presentation/widgets/buttons/next_page_button.dart';
import '../../../../core/presentation/widgets/loading/casual_loader.dart';
import '../../../../core/presentation/widgets/other/products_end.dart';
import '../../../../core/presentation/widgets/other/products_not_found.dart';
import '../../../../core/presentation/widgets/other/search_result.dart';
import '../../../../core/presentation/widgets/text_fields/search_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../features/detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../../../features/detailed_product/presentation/pages/detailed_product_page.dart';
import '../../../domain/entities/info.dart';

class ListPage<B extends Bloc<E, S>, E, S> extends StatefulWidget {
  final void Function(String query) onSearch;
  final VoidCallback? onFilterTap;
  final VoidCallback onPagination;
  final VoidCallback onRefresh;
  final Widget child;
  final BlocListener<B, S> listener;
  final String query;
  final Info searchInfo;
  final bool isFilterActive;
  final bool isRefreshing;
  final bool isPaginating;
  final bool isLoading;
  final bool isLastPage;
  final bool isNothingFound;
  const ListPage({
    super.key,
    required this.onSearch,
    required this.onFilterTap,
    required this.onPagination,
    required this.onRefresh,
    required this.child,
    required this.listener,
    required this.query,
    required this.searchInfo,
    required this.isFilterActive,
    required this.isRefreshing,
    required this.isPaginating,
    required this.isLoading,
    required this.isLastPage,
    required this.isNothingFound,
  });

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late final TextEditingController _searchController = TextEditingController()
    ..addListener(_searchListener);
  late final ScrollController _scrollController = ScrollController()
    ..addListener(_scrollListener);
  final ValueNotifier<bool> _isScrolled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _showNextButton = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _showSearchResult = ValueNotifier<bool>(false);
  final Debouncer _debouncer = Debouncer(milliseconds: 300);

  void _searchListener() =>
      _debouncer.call(() => widget.onSearch(_searchController.text.trim()));

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.onPagination();
        _showNextButton.value = true;
      } else {
        _isScrolled.value = true;
      }
    } else {
      _showNextButton.value = false;
    }
    if (_scrollController.position.pixels > (SizeConfig.isMobile ? 50 : 150)) {
      _isScrolled.value = true;
    } else {
      _isScrolled.value = false;
    }
  }

  void onClearTap(BuildContext context) => _searchController.clear();

  void goTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    _isScrolled.value = false;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _isScrolled.dispose();
    _showNextButton.dispose();
    _showSearchResult.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocListener(
      listeners: [
        widget.listener,
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
          body: SafeArea(
            child: RefreshIndicator(
              color: kDarkBlue,
              onRefresh: () async {
                if (!widget.isRefreshing) {
                  _showNextButton.value = true;
                  widget.onRefresh();
                }
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(20)),
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: ClampingScrollPhysics()),
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.setPadding(20)),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            ValueListenableBuilder(
                              valueListenable: _showSearchResult,
                              builder: (context, showSearchResult, _) {
                                return Column(
                                  children: [
                                    FadeAnimationYDown(
                                      delay: .4,
                                      child: SearchField(
                                        searchController: _searchController,
                                        showClose: widget.query.isNotEmpty,
                                        onClear: () => onClearTap(context),
                                        onFilter: widget.onFilterTap,
                                        isFilterActive: widget.isFilterActive,
                                        toggleSearchResult: () =>
                                            _showSearchResult.value =
                                                !_showSearchResult.value,
                                        showSearchResults: showSearchResult,
                                      ),
                                    ),
                                    SearchResult(
                                      pageCount: widget.searchInfo.pageCount,
                                      productsCount:
                                          widget.searchInfo.itemCount,
                                      showSearchResult: showSearchResult,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.isRefreshing)
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
                    if (widget.isNothingFound &&
                        !widget.isLoading &&
                        !widget.isRefreshing)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: FadeAnimationYDown(
                            delay: .1,
                            child: ProductsNotFound(),
                          ),
                        ),
                      ),
                    if (widget.isLoading)
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
                      widget.child,
                    if (widget.isPaginating)
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
                    if (widget.isLastPage) const ProductsEnd(),
                    if (!widget.isLastPage &&
                        !widget.isPaginating &&
                        !widget.isNothingFound)
                      NextPageButton(
                        onTap: widget.onPagination,
                        showNextButton: _showNextButton,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
