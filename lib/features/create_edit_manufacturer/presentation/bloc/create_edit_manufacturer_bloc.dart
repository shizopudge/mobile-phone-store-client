import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/manufacturer.dart';

import '../../../../core/domain/usecases/image/pick_image.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/usecases/create_manufacturer.dart';
import '../../domain/usecases/edit_manufacturer.dart';
import '../../domain/usecases/upload_manufacturer_image.dart';

part 'create_edit_manufacturer_event.dart';
part 'create_edit_manufacturer_state.dart';
part 'create_edit_manufacturer_bloc.freezed.dart';

class CreateEditManufacturerBloc
    extends Bloc<CreateEditManufacturerEvent, CreateEditManufacturerState> {
  CreateEditManufacturerBloc({
    required PickImage pickImageUsecase,
    required CreateManufacturer createManufacturerUsecase,
    required EditManufacturer editManufacturerUsecase,
    required UploadManufacturerImage uploadManufacturerImageUsecase,
  })  : _pickImageUsecase = pickImageUsecase,
        _createManufacturerUsecase = createManufacturerUsecase,
        _editManufacturerUsecase = editManufacturerUsecase,
        _uploadManufacturerImageUsecase = uploadManufacturerImageUsecase,
        super(const CreateEditManufacturerState()) {
    on<_ChangeName>(_changeName);
    on<_PickImage>(_pickImage);
    on<_CreateManufacturer>(_createManufacturer);
    on<_EditManufacturer>(_editManufacturer);
    on<_SetManufacturer>(_setManufacturer);
  }

  final PickImage _pickImageUsecase;
  final CreateManufacturer _createManufacturerUsecase;
  final EditManufacturer _editManufacturerUsecase;
  final UploadManufacturerImage _uploadManufacturerImageUsecase;

  void _changeName(
          _ChangeName event, Emitter<CreateEditManufacturerState> emit) =>
      emit(state.copyWith(name: event.name));

  FutureOr<void> _pickImage(
      _PickImage event, Emitter<CreateEditManufacturerState> emit) async {
    emit(state.copyWith(status: CreateEditManufacturerStatus.loading));
    final res = await _pickImageUsecase.call(NoParams());
    res.fold((failure) {
      _throwFailure(emit, failure);
    },
        (pickedImage) => emit(state.copyWith(
            image: pickedImage, status: CreateEditManufacturerStatus.initial)));
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
                manufacturer: manufacturer.copyWith(image: uploadedImage))));
      } else {
        emit(state.copyWith(
            status: CreateEditManufacturerStatus.success,
            manufacturer: manufacturer));
      }
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
          res.fold(
              (failure) => _throwFailure(emit, failure),
              (uploadedImage) => emit(state.copyWith(
                  status: CreateEditManufacturerStatus.success,
                  manufacturer: manufacturer.copyWith(image: uploadedImage))));
        } else {
          emit(state.copyWith(
              status: CreateEditManufacturerStatus.success,
              manufacturer: manufacturer));
        }
      });
    }
  }

  void _setManufacturer(
          _SetManufacturer event, Emitter<CreateEditManufacturerState> emit) =>
      emit(state.copyWith(
          name: event.manufacturer.name, manufacturer: event.manufacturer));

  void _throwFailure(
      Emitter<CreateEditManufacturerState> emit, Failure failure) {
    emit(state.copyWith(
        status: CreateEditManufacturerStatus.failure, failure: failure));
    emit(state.copyWith(
        status: CreateEditManufacturerStatus.initial,
        failure: const CasualFailure()));
  }
}
