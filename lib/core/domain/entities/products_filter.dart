import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../constants/enums.dart';

class ProductsFilter extends Equatable {
  final int page;
  final int limit;
  final String query;
  final SortBy sort;
  final double? minCost;
  final double? maxCost;
  final bool newArrival;
  final bool withDiscount;
  const ProductsFilter({
    this.page = 1,
    this.limit = 10,
    this.query = '',
    this.sort = SortBy.desc,
    this.minCost,
    this.maxCost,
    this.newArrival = false,
    this.withDiscount = false,
  });

  ProductsFilter copyWith({
    int? page,
    int? limit,
    String? query,
    SortBy? sort,
    double? minCost,
    double? maxCost,
    bool? newArrival,
    bool? withDiscount,
  }) {
    return ProductsFilter(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      query: query ?? this.query,
      sort: sort ?? this.sort,
      minCost: minCost ?? this.minCost,
      maxCost: maxCost ?? this.maxCost,
      newArrival: newArrival ?? this.newArrival,
      withDiscount: withDiscount ?? this.withDiscount,
    );
  }

  @override
  List<Object?> get props {
    return [
      page,
      limit,
      query,
      sort,
      minCost,
      maxCost,
      newArrival,
      withDiscount,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'limit': limit,
      'query': query,
      'sort': sort.toString(),
      'minCost': minCost,
      'maxCost': maxCost,
      'newArrival': newArrival,
      'withDiscount': withDiscount,
    };
  }

  factory ProductsFilter.fromMap(Map<String, dynamic> map) {
    return ProductsFilter(
      page: map['page'] as int,
      limit: map['limit'] as int,
      query: map['query'] as String,
      sort: SortBy.fromString(map['sort']),
      minCost: map['minCost'] != null ? map['minCost'] as double : null,
      maxCost: map['maxCost'] != null ? map['maxCost'] as double : null,
      newArrival: map['newArrival'] as bool,
      withDiscount: map['withDiscount'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsFilter.fromJson(String source) =>
      ProductsFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}
