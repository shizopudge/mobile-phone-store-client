import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/scrollable/products_grid_view.dart';
import '../bloc/products_bloc.dart';
import 'products_app_bar.dart';

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

  void _searchListener() {}

  void _scrollListener() {}

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductsBloc>().state;
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        ProductsAppBar(searchController: _searchController),
        ProductsGridView(products: state.products),
      ],
    );
  }
}
