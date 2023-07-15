import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/usecases/image/pick_images.dart';
import '../../../../core/domain/usecases/usecase.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../../browse_products/presentation/bloc/browse_products_bloc.dart';
import '../../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../../models/presentation/bloc/models_bloc.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/delete_image.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/edit_product.dart';
import '../../domain/usecases/upload_images.dart';

part 'create_edit_product_bloc.freezed.dart';
part 'create_edit_product_event.dart';
part 'create_edit_product_state.dart';

class CreateEditProductBloc
    extends Bloc<CreateEditProductEvent, CreateEditProductState> {
  CreateEditProductBloc({
    required ModelsBloc modelsBloc,
    required DetailedProductBloc detailedProductBloc,
    required BrowseProductsBloc browseProductsBloc,
    required UploadProductImages uploadProductImagesUsecase,
    required DeleteProductImage deleteProductImageUsecase,
    required CreateProduct createProductUsecase,
    required EditProduct editProduct,
    required PickImages pickImagesUsecase,
    required DeleteProduct deleteProductUsecase,
  })  : _modelsBloc = modelsBloc,
        _detailedProductBloc = detailedProductBloc,
        _browseProductsBloc = browseProductsBloc,
        _uploadProductImagesUsecase = uploadProductImagesUsecase,
        _deleteProductImageUsecase = deleteProductImageUsecase,
        _createProductUsecase = createProductUsecase,
        _editProductusecase = editProduct,
        _pickImagesUsecase = pickImagesUsecase,
        _deleteProductUsecase = deleteProductUsecase,
        super(const CreateEditProductState()) {
    on<_SetProduct>(_setProduct);
    on<_SetModelId>(_setModelId);
    on<_ChangeCost>(_changeCost);
    on<_ChangeColor>(_changeColor);
    on<_ChangeColorCode>(_changeColorCode);
    on<_ChangeStorage>(_changeStorage);
    on<_ChangeInStockCount>(_changeInStockCount);
    on<_ChangeDiscount>(_changeDiscount);
    on<_PickImages>(_pickImages);
    on<_RemovePickedImage>(_removePickedImage);
    on<_DeleteImage>(_deleteImage);
    on<_CreateProduct>(_createProduct);
    on<_EditProduct>(_editProduct);
    on<_DeleteProduct>(_deleteProduct);
    on<_Reset>(_reset);
  }

  final ModelsBloc _modelsBloc;
  final DetailedProductBloc _detailedProductBloc;
  final BrowseProductsBloc _browseProductsBloc;
  final CreateProduct _createProductUsecase;
  final EditProduct _editProductusecase;
  final PickImages _pickImagesUsecase;
  final UploadProductImages _uploadProductImagesUsecase;
  final DeleteProductImage _deleteProductImageUsecase;
  final DeleteProduct _deleteProductUsecase;

  void _setProduct(_SetProduct event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(
          product: event.product,
          cost: event.product.cost,
          color: event.product.color,
          colorCode: event.product.colorCode,
          storage: event.product.storage,
          inStockCount: event.product.inStockCount,
          discount: event.product.discount ?? 0));

  void _setModelId(_SetModelId event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(modelId: event.modelId));

  void _changeCost(_ChangeCost event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(cost: event.cost));

  void _changeColor(_ChangeColor event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(color: event.name));

  void _changeColorCode(
          _ChangeColorCode event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(colorCode: event.code));

  void _changeStorage(
          _ChangeStorage event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(storage: event.storage));

  void _changeInStockCount(
          _ChangeInStockCount event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(inStockCount: event.inStockCount));

  void _changeDiscount(
          _ChangeDiscount event, Emitter<CreateEditProductState> emit) =>
      emit(state.copyWith(discount: event.discount));

  FutureOr<void> _pickImages(
      _PickImages event, Emitter<CreateEditProductState> emit) async {
    final res = await _pickImagesUsecase.call(NoParams());
    res.fold((failure) => _throwFailure(emit, failure), (r) {
      if (state.images.isNotEmpty) {
        emit(state.copyWith(
            status: CreateEditProductStatus.initial,
            images: [...state.images, ...r]));
      } else {
        emit(
            state.copyWith(status: CreateEditProductStatus.initial, images: r));
      }
    });
  }

  void _removePickedImage(
      _RemovePickedImage event, Emitter<CreateEditProductState> emit) {
    final List<File> images = [...state.images];
    images.removeWhere((image) => event.image.path == image.path);
    emit(state.copyWith(images: images));
  }

  FutureOr<void> _deleteImage(
      _DeleteImage event, Emitter<CreateEditProductState> emit) async {
    if (state.product != null) {
      emit(state.copyWith(status: CreateEditProductStatus.loading));
      final res = await _deleteProductImageUsecase.call(
          DeleteProductImageParams(
              id: state.product!.id, imageLink: event.imageLink));
      res.fold((failure) => _throwFailure(emit, failure), (r) {
        final List<String> remainingImages = [...state.product!.images]
          ..remove(event.imageLink);
        emit(state.copyWith(
            status: CreateEditProductStatus.initial,
            product: state.product!.copyWith(images: remainingImages)));
        _detailedProductBloc
            .add(DetailedProductEvent.getOneProduct(id: state.product!.id));
      });
    }
  }

  FutureOr<void> _createProduct(
      _CreateProduct event, Emitter<CreateEditProductState> emit) async {
    emit(state.copyWith(status: CreateEditProductStatus.loading));
    if (state.cost != 0.0 &&
        state.color.isNotEmpty &&
        state.colorCode.isNotEmpty &&
        state.storage != 0 &&
        state.modelId != null) {
      final res = await _createProductUsecase.call(CreateProductParams(
        modelId: state.modelId!,
        cost: state.cost,
        color: state.color,
        colorCode: state.colorCode,
        storage: state.storage,
        inStockCount: state.inStockCount,
        discount: state.discount == 0 ? null : state.discount,
      ));
      await res.fold((failure) {
        _throwFailure(emit, failure);
      }, (createdProduct) async {
        if (state.images.isNotEmpty) {
          final res = await _uploadProductImagesUsecase.call(
              UploadProductImagesParams(
                  id: createdProduct.id, images: state.images));
          res.fold(
              (failure) => _throwFailure(emit, failure),
              (r) => emit(state.copyWith(
                  status: CreateEditProductStatus.success,
                  product: createdProduct)));
        } else {
          emit(state.copyWith(
              status: CreateEditProductStatus.success,
              product: createdProduct));
        }
      });
      _browseProductsBloc.add(const BrowseProductsEvent.refresh());
      _modelsBloc.add(const ModelsEvent.refresh());
    }
  }

  FutureOr<void> _editProduct(
      _EditProduct event, Emitter<CreateEditProductState> emit) async {
    emit(state.copyWith(status: CreateEditProductStatus.loading));
    if (state.product != null) {
      if (state.cost != 0.0 &&
          state.color.isNotEmpty &&
          state.colorCode.isNotEmpty &&
          state.storage != 0) {
        final res = await _editProductusecase.call(
          EditProductParams(
            id: state.product!.id,
            modelId: state.product!.model?.id ?? '',
            cost: state.cost,
            color: state.color,
            colorCode: state.colorCode,
            storage: state.storage,
            inStockCount: state.inStockCount,
            discount: state.discount == 0 ? null : state.discount,
          ),
        );
        await res.fold((failure) {
          _throwFailure(emit, failure);
        }, (updatedProduct) async {
          if (state.images.isNotEmpty) {
            final res = await _uploadProductImagesUsecase.call(
                UploadProductImagesParams(
                    id: updatedProduct.id, images: state.images));
            res.fold((failure) => _throwFailure(emit, failure), (r) {
              emit(
                state.copyWith(
                  status: CreateEditProductStatus.success,
                  product: updatedProduct,
                ),
              );
              _detailedProductBloc.add(
                  DetailedProductEvent.getOneProduct(id: updatedProduct.id));
            });
          } else {
            emit(
              state.copyWith(
                status: CreateEditProductStatus.success,
                product: updatedProduct,
              ),
            );
            _detailedProductBloc
                .add(DetailedProductEvent.getOneProduct(id: updatedProduct.id));
          }
        });
      }
    }
  }

  FutureOr<void> _deleteProduct(
      _DeleteProduct event, Emitter<CreateEditProductState> emit) async {
    if (state.product != null) {
      emit(state.copyWith(status: CreateEditProductStatus.loading));
      final res = await _deleteProductUsecase
          .call(DeleteProductParams(id: state.product!.id));
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(
            state.copyWith(
              status: CreateEditProductStatus.success,
            ),
          );
          _detailedProductBloc.add(const DetailedProductEvent.reset());
          _browseProductsBloc.add(const BrowseProductsEvent.refresh());
          _modelsBloc.add(const ModelsEvent.refresh());
        },
      );
    }
  }

  void _reset(_Reset event, Emitter<CreateEditProductState> emit) =>
      emit(const CreateEditProductState());

  void _throwFailure(Emitter<CreateEditProductState> emit, Failure failure) {
    emit(state.copyWith(
        status: CreateEditProductStatus.failure, failure: failure));
    emit(state.copyWith(
        status: CreateEditProductStatus.initial,
        failure: const CasualFailure()));
  }
}
