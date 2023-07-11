import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/info.dart';

part 'items_info_model.freezed.dart';
part 'items_info_model.g.dart';

@freezed
class InfoModel with _$InfoModel {
  const InfoModel._();
  const factory InfoModel({
    required int currentPage,
    required int countOnPage,
    required int pageCount,
    required int itemCount,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  factory InfoModel.fromEntity(Info entity) => InfoModel(
      currentPage: entity.currentPage,
      countOnPage: entity.countOnPage,
      pageCount: entity.pageCount,
      itemCount: entity.itemCount);
}
