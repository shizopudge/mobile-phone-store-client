import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_info_model.freezed.dart';
part 'items_info_model.g.dart';

@freezed
class InfoModel with _$InfoModel {
  const factory InfoModel({
    required int currentPage,
    required int countOnPage,
    required int pageCount,
    required int itemCount,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}
