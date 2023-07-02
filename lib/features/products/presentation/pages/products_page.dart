import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/product_card.dart';

import '../../../../core/api/dio_client.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/presentation/widgets/stack_loading.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../data/datasources/products_remote_data_source.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../bloc/products_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late final TextEditingController _searchController = TextEditingController()
    ..addListener(_searchListener);
  final ScrollController _scrollController = ScrollController();

  void _searchListener() {}

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsBloc(
          getProductsUsecase: GetProducts(ProductsRepositoryImpl(
              remoteDataSource:
                  ProductsRemoteDataSourceImpl(getIt<DioClient>()))))
        ..add(const ProductsEvent.start()),
      child: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state.isFailure) {
            PopupUtils.showFailureSnackBar(
                context: context, failure: state.failure);
          }
        },
        builder: (context, state) {
          final List<Product> products = state.products;
          return StackLoading(
            isLoading: state.isLoading,
            child: Scaffold(
              backgroundColor: kWhite,
              body: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: kWhite,
                    centerTitle: true,
                    toolbarHeight: 100,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: _searchController,
                            cursorColor: kDarkBlue,
                            style: kSemiBold.copyWith(
                                fontSize: 18, color: kDarkBlue),
                            decoration: InputDecoration(
                              fillColor: kLightWhite,
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: kDarkBlue,
                              ),
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CloseButton(
                                    onPressed: () {},
                                    color: kDarkBlue,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.filter_list_rounded,
                                      color: kDarkBlue,
                                    ),
                                  ),
                                ],
                              ),
                              hintText: 'Search',
                              hintStyle: kSemiBold.copyWith(
                                  fontSize: 18, color: kGrey),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(
                                  21,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(
                                  21,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(
                                  21,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 20, bottom: 100),
                    sliver: SliverGrid.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: .75),
                      itemBuilder: (context, i) {
                        final Product product = products[i];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
