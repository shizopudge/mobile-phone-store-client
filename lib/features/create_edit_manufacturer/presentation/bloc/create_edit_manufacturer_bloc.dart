import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/manufacturer.dart';
import '../../../../core/domain/usecases/image/pick_image.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/failure/failure.dart';
import '../../../manufacturers/presentation/bloc/manufacturers_bloc.dart';
import '../../domain/usecases/create_manufacturer.dart';
import '../../domain/usecases/delete_manufacturer_image.dart';
import '../../domain/usecases/edit_manufacturer.dart';
import '../../domain/usecases/upload_manufacturer_image.dart';

part 'create_edit_manufacturer_bloc.freezed.dart';
part 'create_edit_manufacturer_event.dart';
part 'create_edit_manufacturer_state.dart';

class CreateEditManufacturerBloc
    extends Bloc<CreateEditManufacturerEvent, CreateEditManufacturerState> {
  CreateEditManufacturerBloc({
    required ManufacturersBloc manufacturersBloc,
    required PickImage pickImageUsecase,
    required CreateManufacturer createManufacturerUsecase,
    required EditManufacturer editManufacturerUsecase,
    required UploadManufacturerImage uploadManufacturerImageUsecase,
    required DeleteManufacturerImage deleteManufacturerImageUsecase,
  })  : _manufacturersBloc = manufacturersBloc,
        _pickImageUsecase = pickImageUsecase,
        _createManufacturerUsecase = createManufacturerUsecase,
        _editManufacturerUsecase = editManufacturerUsecase,
        _uploadManufacturerImageUsecase = uploadManufacturerImageUsecase,
        _deleteManufacturerImageUsecase = deleteManufacturerImageUsecase,
        super(const CreateEditManufacturerState()) {
    on<_ChangeName>(_changeName);
    on<_PickImage>(_pickImage);
    on<_DeleteImage>(_deleteImage);
    on<_CreateManufacturer>(_createManufacturer);
    on<_EditManufacturer>(_editManufacturer);
    on<_SetManufacturer>(_setManufacturer);
    on<_Initial>(_initial);
    on<_Reset>(_reset);
  }

  final ManufacturersBloc _manufacturersBloc;
  final PickImage _pickImageUsecase;
  final CreateManufacturer _createManufacturerUsecase;
  final EditManufacturer _editManufacturerUsecase;
  final UploadManufacturerImage _uploadManufacturerImageUsecase;
  final DeleteManufacturerImage _deleteManufacturerImageUsecase;

  void _initial(_Initial event, Emitter<CreateEditManufacturerState> emit) {
    if (state.manufacturer == null) {
      emit(const CreateEditManufacturerState());
    }
  }

  void _changeName(
          _ChangeName event, Emitter<CreateEditManufacturerState> emit) =>
      emit(state.copyWith(name: event.name));

  FutureOr<void> _pickImage(
      _PickImage event, Emitter<CreateEditManufacturerState> emit) async {
    final res = await _pickImageUsecase.call(NoParams());
    res.fold((failure) {
      _throwFailure(emit, failure);
    },
        (pickedImage) => emit(state.copyWith(
            image: pickedImage, status: CreateEditManufacturerStatus.initial)));
  }

  FutureOr<void> _deleteImage(
      _DeleteImage event, Emitter<CreateEditManufacturerState> emit) async {
    emit(state.copyWith(status: CreateEditManufacturerStatus.loading));
    if (state.manufacturer != null) {
      final res = await _deleteManufacturerImageUsecase
          .call(DeleteManufacturerImageParams(id: state.manufacturer!.id));
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(state.copyWith(
              status: CreateEditManufacturerStatus.success,
              manufacturer: state.manufacturer!.copyWithImage(newImage: null)));
          _manufacturersBloc.add(ManufacturersEvent.updateManufacturerInList(
              state.manufacturer!.copyWithImage(newImage: null)));
        },
      );
    }
  }

  FutureOr<void> _createManufacturer(_CreateManufacturer event,
      Emitter<CreateEditManufacturerState> emit) async {
    emit(state.copyWith(status: CreateEditManufacturerStatus.loading));
    final res = await _createManufacturerUsecase
        .call(CreateManufacturerParams(name: state.name));
    await res.fold((failure) {
      _throwFailure(emit, failure);
    }, (manufacturer) async {
      if (state.image != null) {
        final res = await _uploadManufacturerImageUsecase.call(
            UploadManufacturerImageParams(
                id: manufacturer.id, image: state.image!));
        res.fold(
            (failure) => _throwFailure(emit, failure),
            (uploadedImage) => emit(state.copyWith(
                status: CreateEditManufacturerStatus.success,
                manufacturer:
                    manufacturer.copyWithImage(newImage: uploadedImage))));
      } else {
        emit(state.copyWith(
            status: CreateEditManufacturerStatus.success,
            manufacturer: manufacturer));
      }
      _manufacturersBloc.add(const ManufacturersEvent.refresh());
    });
  }

  FutureOr<void> _editManufacturer(_EditManufacturer event,
      Emitter<CreateEditManufacturerState> emit) async {
    if (state.manufacturer != null) {
      emit(state.copyWith(status: CreateEditManufacturerStatus.loading));
      final res = await _editManufacturerUsecase.call(
          EditManufacturerParams(id: state.manufacturer!.id, name: state.name));
      await res.fold((failure) {
        _throwFailure(emit, failure);
      }, (manufacturer) async {
        if (state.image != null) {
          final res = await _uploadManufacturerImageUsecase.call(
              UploadManufacturerImageParams(
                  id: manufacturer.id, image: state.image!));
          res.fold((failure) => _throwFailure(emit, failure), (uploadedImage) {
            emit(state.copyWith(
                status: CreateEditManufacturerStatus.success,
                manufacturer:
                    manufacturer.copyWithImage(newImage: uploadedImage)));
            _manufacturersBloc.add(ManufacturersEvent.updateManufacturerInList(
                manufacturer.copyWithImage(newImage: uploadedImage)));
          });
        } else {
          emit(state.copyWith(
              status: CreateEditManufacturerStatus.success,
              manufacturer: manufacturer));
          _manufacturersBloc
              .add(ManufacturersEvent.updateManufacturerInList(manufacturer));
        }
      });
    }
  }

  void _setManufacturer(
          _SetManufacturer event, Emitter<CreateEditManufacturerState> emit) =>
      emit(state.copyWith(
          name: event.manufacturer.name, manufacturer: event.manufacturer));

  void _reset(_Reset event, Emitter<CreateEditManufacturerState> emit) =>
      emit(const CreateEditManufacturerState());

  void _throwFailure(
      Emitter<CreateEditManufacturerState> emit, Failure failure) {
    emit(state.copyWith(
        status: CreateEditManufacturerStatus.failure, failure: failure));
    emit(state.copyWith(
        status: CreateEditManufacturerStatus.initial,
        failure: const CasualFailure()));
  }
}
