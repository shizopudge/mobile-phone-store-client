// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturers_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ManufacturersState _$$_ManufacturersStateFromJson(
        Map<String, dynamic> json) =>
    _$_ManufacturersState(
      info: json['info'] == null
          ? const Info.initial()
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      manufacturers: (json['manufacturers'] as List<dynamic>?)
              ?.map((e) => Manufacturer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status:
          $enumDecodeNullable(_$ManufacturersStatusEnumMap, json['status']) ??
              ManufacturersStatus.initial,
      filter: json['filter'] == null
          ? const SimpleFilter()
          : SimpleFilter.fromJson(json['filter'] as String),
      failure: json['failure'] == null
          ? const CasualFailure()
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ManufacturersStateToJson(
        _$_ManufacturersState instance) =>
    <String, dynamic>{
      'info': instance.info,
      'manufacturers': instance.manufacturers,
      'status': _$ManufacturersStatusEnumMap[instance.status]!,
      'filter': instance.filter,
      'failure': instance.failure,
    };

const _$ManufacturersStatusEnumMap = {
  ManufacturersStatus.initial: 'initial',
  ManufacturersStatus.loading: 'loading',
  ManufacturersStatus.refreshing: 'refreshing',
  ManufacturersStatus.success: 'success',
  ManufacturersStatus.failure: 'failure',
};
