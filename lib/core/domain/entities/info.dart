import 'package:equatable/equatable.dart';

import '../../data/models/info/info_model.dart';

class Info extends Equatable {
  final int currentPage;
  final int countOnPage;
  final int pageCount;
  final int itemCount;
  const Info({
    required this.currentPage,
    required this.countOnPage,
    required this.pageCount,
    required this.itemCount,
  });
  const Info.initial({
    this.currentPage = 1,
    this.countOnPage = 0,
    this.pageCount = 1,
    this.itemCount = 0,
  });

  factory Info.fromModel(InfoModel model) => Info(
      currentPage: model.currentPage,
      countOnPage: model.countOnPage,
      pageCount: model.pageCount,
      itemCount: model.itemCount);

  @override
  List<Object> get props => [currentPage, countOnPage, pageCount, itemCount];

  factory Info.fromJson(Map<String, dynamic> json) =>
      Info.fromModel(InfoModel.fromJson(json));

  Map<String, dynamic> toJson() => InfoModel.fromEntity(this).toJson();
}
