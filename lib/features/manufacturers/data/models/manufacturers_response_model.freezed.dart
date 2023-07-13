// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manufacturers_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManufacturersResponseModel _$ManufacturersResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ManufacturersResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ManufacturersResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<ManufacturerModel> get manufacturers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManufacturersResponseModelCopyWith<ManufacturersResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManufacturersResponseModelCopyWith<$Res> {
  factory $ManufacturersResponseModelCopyWith(ManufacturersResponseModel value,
          $Res Function(ManufacturersResponseModel) then) =
      _$ManufacturersResponseModelCopyWithImpl<$Res,
          ManufacturersResponseModel>;
  @useResult
  $Res call({InfoModel info, List<ManufacturerModel> manufacturers});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$ManufacturersResponseModelCopyWithImpl<$Res,
        $Val extends ManufacturersResponseModel>
    implements $ManufacturersResponseModelCopyWith<$Res> {
  _$ManufacturersResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? manufacturers = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      manufacturers: null == manufacturers
          ? _value.manufacturers
          : manufacturers // ignore: cast_nullable_to_non_nullable
              as List<ManufacturerModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InfoModelCopyWith<$Res> get info {
    return $InfoModelCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ManufacturersResponseModelCopyWith<$Res>
    implements $ManufacturersResponseModelCopyWith<$Res> {
  factory _$$_ManufacturersResponseModelCopyWith(
          _$_ManufacturersResponseModel value,
          $Res Function(_$_ManufacturersResponseModel) then) =
      __$$_ManufacturersResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<ManufacturerModel> manufacturers});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$_ManufacturersResponseModelCopyWithImpl<$Res>
    extends _$ManufacturersResponseModelCopyWithImpl<$Res,
        _$_ManufacturersResponseModel>
    implements _$$_ManufacturersResponseModelCopyWith<$Res> {
  __$$_ManufacturersResponseModelCopyWithImpl(
      _$_ManufacturersResponseModel _value,
      $Res Function(_$_ManufacturersResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? manufacturers = null,
  }) {
    return _then(_$_ManufacturersResponseModel(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      manufacturers: null == manufacturers
          ? _value._manufacturers
          : manufacturers // ignore: cast_nullable_to_non_nullable
              as List<ManufacturerModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManufacturersResponseModel implements _ManufacturersResponseModel {
  const _$_ManufacturersResponseModel(
      {required this.info,
      required final List<ManufacturerModel> manufacturers})
      : _manufacturers = manufacturers;

  factory _$_ManufacturersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ManufacturersResponseModelFromJson(json);

  @override
  final InfoModel info;
  final List<ManufacturerModel> _manufacturers;
  @override
  List<ManufacturerModel> get manufacturers {
    if (_manufacturers is EqualUnmodifiableListView) return _manufacturers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manufacturers);
  }

  @override
  String toString() {
    return 'ManufacturersResponseModel(info: $info, manufacturers: $manufacturers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManufacturersResponseModel &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other._manufacturers, _manufacturers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_manufacturers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManufacturersResponseModelCopyWith<_$_ManufacturersResponseModel>
      get copyWith => __$$_ManufacturersResponseModelCopyWithImpl<
          _$_ManufacturersResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManufacturersResponseModelToJson(
      this,
    );
  }
}

abstract class _ManufacturersResponseModel
    implements ManufacturersResponseModel {
  const factory _ManufacturersResponseModel(
          {required final InfoModel info,
          required final List<ManufacturerModel> manufacturers}) =
      _$_ManufacturersResponseModel;

  factory _ManufacturersResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ManufacturersResponseModel.fromJson;

  @override
  InfoModel get info;
  @override
  List<ManufacturerModel> get manufacturers;
  @override
  @JsonKey(ignore: true)
  _$$_ManufacturersResponseModelCopyWith<_$_ManufacturersResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
