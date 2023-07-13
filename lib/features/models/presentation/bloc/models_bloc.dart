import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models_event.dart';
part 'models_state.dart';
part 'models_bloc.freezed.dart';

class ModelsBloc extends Bloc<ModelsEvent, ModelsState> {
  ModelsBloc() : super(_Initial()) {
    on<ModelsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
