// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manufacturer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManufacturerModel _$ManufacturerModelFromJson(Map<String, dynamic> json) {
  return _ManufacturerModel.fromJson(json);
}

/// @nodoc
mixin _$ManufacturerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManufacturerModelCopyWith<ManufacturerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManufacturerModelCopyWith<$Res> {
  factory $ManufacturerModelCopyWith(
          ManufacturerModel value, $Res Function(ManufacturerModel) then) =
      _$ManufacturerModelCopyWithImpl<$Res, ManufacturerModel>;
  @useResult
  $Res call({String id, String name, String? image});
}

/// @nodoc
class _$ManufacturerModelCopyWithImpl<$Res, $Val extends ManufacturerModel>
    implements $ManufacturerModelCopyWith<$Res> {
  _$ManufacturerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManufacturerModelCopyWith<$Res>
    implements $ManufacturerModelCopyWith<$Res> {
  factory _$$_ManufacturerModelCopyWith(_$_ManufacturerModel value,
          $Res Function(_$_ManufacturerModel) then) =
      __$$_ManufacturerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? image});
}

/// @nodoc
class __$$_ManufacturerModelCopyWithImpl<$Res>
    extends _$ManufacturerModelCopyWithImpl<$Res, _$_ManufacturerModel>
    implements _$$_ManufacturerModelCopyWith<$Res> {
  __$$_ManufacturerModelCopyWithImpl(
      _$_ManufacturerModel _value, $Res Function(_$_ManufacturerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_$_ManufacturerModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManufacturerModel extends _ManufacturerModel {
  const _$_ManufacturerModel(
      {required this.id, required this.name, required this.image})
      : super._();

  factory _$_ManufacturerModel.fromJson(Map<String, dynamic> json) =>
      _$$_ManufacturerModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? image;

  @override
  String toString() {
    return 'ManufacturerModel(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManufacturerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManufacturerModelCopyWith<_$_ManufacturerModel> get copyWith =>
      __$$_ManufacturerModelCopyWithImpl<_$_ManufacturerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManufacturerModelToJson(
      this,
    );
  }
}

abstract class _ManufacturerModel extends ManufacturerModel {
  const factory _ManufacturerModel(
      {required final String id,
      required final String name,
      required final String? image}) = _$_ManufacturerModel;
  const _ManufacturerModel._() : super._();

  factory _ManufacturerModel.fromJson(Map<String, dynamic> json) =
      _$_ManufacturerModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_ManufacturerModelCopyWith<_$_ManufacturerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
