import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';

part 'create_edit_product_bloc.freezed.dart';
part 'create_edit_product_event.dart';
part 'create_edit_product_state.dart';

class CreateEditProductBloc
    extends Bloc<CreateEditProductEvent, CreateEditProductState> {
  CreateEditProductBloc() : super(const CreateEditProductState()) {
    on<CreateEditProductEvent>((event, emit) {});
  }
}
