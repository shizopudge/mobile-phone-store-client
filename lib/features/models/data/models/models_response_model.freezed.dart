// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModelsResponseModel _$ModelsResponseModelFromJson(Map<String, dynamic> json) {
  return _ModelsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ModelsResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<ModelModel> get models => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelsResponseModelCopyWith<ModelsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelsResponseModelCopyWith<$Res> {
  factory $ModelsResponseModelCopyWith(
          ModelsResponseModel value, $Res Function(ModelsResponseModel) then) =
      _$ModelsResponseModelCopyWithImpl<$Res, ModelsResponseModel>;
  @useResult
  $Res call({InfoModel info, List<ModelModel> models});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$ModelsResponseModelCopyWithImpl<$Res, $Val extends ModelsResponseModel>
    implements $ModelsResponseModelCopyWith<$Res> {
  _$ModelsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? models = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      models: null == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<ModelModel>,
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
abstract class _$$_ModelsResponseModelCopyWith<$Res>
    implements $ModelsResponseModelCopyWith<$Res> {
  factory _$$_ModelsResponseModelCopyWith(_$_ModelsResponseModel value,
          $Res Function(_$_ModelsResponseModel) then) =
      __$$_ModelsResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<ModelModel> models});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$_ModelsResponseModelCopyWithImpl<$Res>
    extends _$ModelsResponseModelCopyWithImpl<$Res, _$_ModelsResponseModel>
    implements _$$_ModelsResponseModelCopyWith<$Res> {
  __$$_ModelsResponseModelCopyWithImpl(_$_ModelsResponseModel _value,
      $Res Function(_$_ModelsResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? models = null,
  }) {
    return _then(_$_ModelsResponseModel(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<ModelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelsResponseModel implements _ModelsResponseModel {
  const _$_ModelsResponseModel(
      {required this.info, required final List<ModelModel> models})
      : _models = models;

  factory _$_ModelsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ModelsResponseModelFromJson(json);

  @override
  final InfoModel info;
  final List<ModelModel> _models;
  @override
  List<ModelModel> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  @override
  String toString() {
    return 'ModelsResponseModel(info: $info, models: $models)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelsResponseModel &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_models));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModelsResponseModelCopyWith<_$_ModelsResponseModel> get copyWith =>
      __$$_ModelsResponseModelCopyWithImpl<_$_ModelsResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelsResponseModelToJson(
      this,
    );
  }
}

abstract class _ModelsResponseModel implements ModelsResponseModel {
  const factory _ModelsResponseModel(
      {required final InfoModel info,
      required final List<ModelModel> models}) = _$_ModelsResponseModel;

  factory _ModelsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ModelsResponseModel.fromJson;

  @override
  InfoModel get info;
  @override
  List<ModelModel> get models;
  @override
  @JsonKey(ignore: true)
  _$$_ModelsResponseModelCopyWith<_$_ModelsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
