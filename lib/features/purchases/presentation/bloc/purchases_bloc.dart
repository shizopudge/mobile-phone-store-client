import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchases_bloc.freezed.dart';
part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc() : super(_Initial()) {
    on<PurchasesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
