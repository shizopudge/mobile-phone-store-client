import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_manufacturer_event.dart';
part 'detailed_manufacturer_state.dart';
part 'detailed_manufacturer_bloc.freezed.dart';

class DetailedManufacturerBloc extends Bloc<DetailedManufacturerEvent, DetailedManufacturerState> {
  DetailedManufacturerBloc() : super(_Initial()) {
    on<DetailedManufacturerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
