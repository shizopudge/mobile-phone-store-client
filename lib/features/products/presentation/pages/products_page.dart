import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_client.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/utils/page_transition_util.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../data/datasources/products_remote_data_source.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../../domain/usecases/get_products.dart';
import '../bloc/products_bloc.dart';
import '../widgets/products_body.dart';
import 'detailed_product_page.dart';

class ProductsScrollCubit extends Cubit<bool> {
  ProductsScrollCubit() : super(false);

  void setScrolled() => emit(true);

  void setNotScrolled() => emit(false);
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsBloc(
          getProductsUsecase: GetProducts(ProductsRepositoryImpl(
              remoteDataSource:
                  ProductsRemoteDataSourceImpl(getIt<DioClient>()))))
        ..add(const ProductsEvent.start()),
      child: BlocListener<ProductsBloc, ProductsState>(
        listenWhen: (previous, current) =>
            previous.selectedProduct == null || current.isFailure,
        listener: (context, state) {
          if (state.isFailure) {
            PopupUtils.showFailureSnackBar(
                context: context, failure: state.failure);
          }
          if (state.selectedProduct != null) {
            Navigator.of(context).push(PageTransitionUtil.go(
                page: BlocProvider.value(
                    value: BlocProvider.of<ProductsBloc>(context),
                    child: const DetailedProduct()),
                duration: const Duration(milliseconds: 350)));
          }
        },
        child: BlocProvider(
          create: (_) => ProductsScrollCubit(),
          child: const ProductsBody(),
        ),
      ),
    );
  }
}
