import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/info/items_info_model.dart';

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

  Info copyWith({
    int? currentPage,
    int? countOnPage,
    int? pageCount,
    int? itemCount,
  }) {
    return Info(
      currentPage: currentPage ?? this.currentPage,
      countOnPage: countOnPage ?? this.countOnPage,
      pageCount: pageCount ?? this.pageCount,
      itemCount: itemCount ?? this.itemCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPage': currentPage,
      'countOnPage': countOnPage,
      'pageCount': pageCount,
      'itemCount': itemCount,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      currentPage: map['currentPage'] as int,
      countOnPage: map['countOnPage'] as int,
      pageCount: map['pageCount'] as int,
      itemCount: map['itemCount'] as int,
    );
  }

  factory Info.fromModel(InfoModel model) => Info(
      currentPage: model.currentPage,
      countOnPage: model.countOnPage,
      pageCount: model.pageCount,
      itemCount: model.itemCount);

  @override
  List<Object> get props => [currentPage, countOnPage, pageCount, itemCount];

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) =>
      Info.fromMap(json.decode(source) as Map<String, dynamic>);
}
