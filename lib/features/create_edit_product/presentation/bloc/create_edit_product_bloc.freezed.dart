// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_edit_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateEditProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEditProductEventCopyWith<$Res> {
  factory $CreateEditProductEventCopyWith(CreateEditProductEvent value,
          $Res Function(CreateEditProductEvent) then) =
      _$CreateEditProductEventCopyWithImpl<$Res, CreateEditProductEvent>;
}

/// @nodoc
class _$CreateEditProductEventCopyWithImpl<$Res,
        $Val extends CreateEditProductEvent>
    implements $CreateEditProductEventCopyWith<$Res> {
  _$CreateEditProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$CreateEditProductEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'CreateEditProductEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CreateEditProductEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$CreateEditProductState {
  String get color => throw _privateConstructorUsedError;
  String get colorCode => throw _privateConstructorUsedError;
  String get modelId => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  int? get storage => throw _privateConstructorUsedError;
  int? get screenRefreshRate => throw _privateConstructorUsedError;
  CreateEditProductStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;
  List<File>? get images => throw _privateConstructorUsedError;
  Product? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateEditProductStateCopyWith<CreateEditProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEditProductStateCopyWith<$Res> {
  factory $CreateEditProductStateCopyWith(CreateEditProductState value,
          $Res Function(CreateEditProductState) then) =
      _$CreateEditProductStateCopyWithImpl<$Res, CreateEditProductState>;
  @useResult
  $Res call(
      {String color,
      String colorCode,
      String modelId,
      double? cost,
      int? storage,
      int? screenRefreshRate,
      CreateEditProductStatus status,
      Failure failure,
      List<File>? images,
      Product? model});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$CreateEditProductStateCopyWithImpl<$Res,
        $Val extends CreateEditProductState>
    implements $CreateEditProductStateCopyWith<$Res> {
  _$CreateEditProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? colorCode = null,
    Object? modelId = null,
    Object? cost = freezed,
    Object? storage = freezed,
    Object? screenRefreshRate = freezed,
    Object? status = null,
    Object? failure = null,
    Object? images = freezed,
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      storage: freezed == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as int?,
      screenRefreshRate: freezed == screenRefreshRate
          ? _value.screenRefreshRate
          : screenRefreshRate // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateEditProductStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateEditProductStateCopyWith<$Res>
    implements $CreateEditProductStateCopyWith<$Res> {
  factory _$$_CreateEditProductStateCopyWith(_$_CreateEditProductState value,
          $Res Function(_$_CreateEditProductState) then) =
      __$$_CreateEditProductStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String color,
      String colorCode,
      String modelId,
      double? cost,
      int? storage,
      int? screenRefreshRate,
      CreateEditProductStatus status,
      Failure failure,
      List<File>? images,
      Product? model});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_CreateEditProductStateCopyWithImpl<$Res>
    extends _$CreateEditProductStateCopyWithImpl<$Res,
        _$_CreateEditProductState>
    implements _$$_CreateEditProductStateCopyWith<$Res> {
  __$$_CreateEditProductStateCopyWithImpl(_$_CreateEditProductState _value,
      $Res Function(_$_CreateEditProductState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? colorCode = null,
    Object? modelId = null,
    Object? cost = freezed,
    Object? storage = freezed,
    Object? screenRefreshRate = freezed,
    Object? status = null,
    Object? failure = null,
    Object? images = freezed,
    Object? model = freezed,
  }) {
    return _then(_$_CreateEditProductState(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      storage: freezed == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as int?,
      screenRefreshRate: freezed == screenRefreshRate
          ? _value.screenRefreshRate
          : screenRefreshRate // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateEditProductStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc

class _$_CreateEditProductState extends _CreateEditProductState {
  const _$_CreateEditProductState(
      {this.color = '',
      this.colorCode = '',
      this.modelId = '',
      this.cost,
      this.storage,
      this.screenRefreshRate,
      this.status = CreateEditProductStatus.initial,
      this.failure = const CasualFailure(),
      final List<File>? images,
      this.model})
      : _images = images,
        super._();

  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final String colorCode;
  @override
  @JsonKey()
  final String modelId;
  @override
  final double? cost;
  @override
  final int? storage;
  @override
  final int? screenRefreshRate;
  @override
  @JsonKey()
  final CreateEditProductStatus status;
  @override
  @JsonKey()
  final Failure failure;
  final List<File>? _images;
  @override
  List<File>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Product? model;

  @override
  String toString() {
    return 'CreateEditProductState(color: $color, colorCode: $colorCode, modelId: $modelId, cost: $cost, storage: $storage, screenRefreshRate: $screenRefreshRate, status: $status, failure: $failure, images: $images, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateEditProductState &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.modelId, modelId) || other.modelId == modelId) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            (identical(other.screenRefreshRate, screenRefreshRate) ||
                other.screenRefreshRate == screenRefreshRate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      color,
      colorCode,
      modelId,
      cost,
      storage,
      screenRefreshRate,
      status,
      failure,
      const DeepCollectionEquality().hash(_images),
      model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateEditProductStateCopyWith<_$_CreateEditProductState> get copyWith =>
      __$$_CreateEditProductStateCopyWithImpl<_$_CreateEditProductState>(
          this, _$identity);
}

abstract class _CreateEditProductState extends CreateEditProductState {
  const factory _CreateEditProductState(
      {final String color,
      final String colorCode,
      final String modelId,
      final double? cost,
      final int? storage,
      final int? screenRefreshRate,
      final CreateEditProductStatus status,
      final Failure failure,
      final List<File>? images,
      final Product? model}) = _$_CreateEditProductState;
  const _CreateEditProductState._() : super._();

  @override
  String get color;
  @override
  String get colorCode;
  @override
  String get modelId;
  @override
  double? get cost;
  @override
  int? get storage;
  @override
  int? get screenRefreshRate;
  @override
  CreateEditProductStatus get status;
  @override
  Failure get failure;
  @override
  List<File>? get images;
  @override
  Product? get model;
  @override
  @JsonKey(ignore: true)
  _$$_CreateEditProductStateCopyWith<_$_CreateEditProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
