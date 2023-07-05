import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_client.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../data/datasources/products_remote_data_source.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../../domain/usecases/get_products.dart';
import '../bloc/products_bloc.dart';
import '../widgets/products_body.dart';

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
      child: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state.isFailure) {
            PopupUtils.showFailureSnackBar(
                context: context, failure: state.failure);
          }
        },
        builder: (context, state) {
          return StackLoading(
            isLoading: state.isLoading,
            child: BlocProvider(
              create: (_) => ProductsScrollCubit(),
              child: const ProductsBody(),
            ),
          );
        },
      ),
    );
  }
}