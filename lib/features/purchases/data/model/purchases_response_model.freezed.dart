// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchasesResponseModel _$PurchasesResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PurchasesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PurchasesResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<PurchaseModel> get purchases => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchasesResponseModelCopyWith<PurchasesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesResponseModelCopyWith<$Res> {
  factory $PurchasesResponseModelCopyWith(PurchasesResponseModel value,
          $Res Function(PurchasesResponseModel) then) =
      _$PurchasesResponseModelCopyWithImpl<$Res, PurchasesResponseModel>;
  @useResult
  $Res call({InfoModel info, List<PurchaseModel> purchases});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$PurchasesResponseModelCopyWithImpl<$Res,
        $Val extends PurchasesResponseModel>
    implements $PurchasesResponseModelCopyWith<$Res> {
  _$PurchasesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? purchases = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      purchases: null == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<PurchaseModel>,
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
abstract class _$$_PurchasesResponseModelCopyWith<$Res>
    implements $PurchasesResponseModelCopyWith<$Res> {
  factory _$$_PurchasesResponseModelCopyWith(_$_PurchasesResponseModel value,
          $Res Function(_$_PurchasesResponseModel) then) =
      __$$_PurchasesResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<PurchaseModel> purchases});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$_PurchasesResponseModelCopyWithImpl<$Res>
    extends _$PurchasesResponseModelCopyWithImpl<$Res,
        _$_PurchasesResponseModel>
    implements _$$_PurchasesResponseModelCopyWith<$Res> {
  __$$_PurchasesResponseModelCopyWithImpl(_$_PurchasesResponseModel _value,
      $Res Function(_$_PurchasesResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? purchases = null,
  }) {
    return _then(_$_PurchasesResponseModel(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      purchases: null == purchases
          ? _value._purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<PurchaseModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PurchasesResponseModel implements _PurchasesResponseModel {
  const _$_PurchasesResponseModel(
      {required this.info, required final List<PurchaseModel> purchases})
      : _purchases = purchases;

  factory _$_PurchasesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PurchasesResponseModelFromJson(json);

  @override
  final InfoModel info;
  final List<PurchaseModel> _purchases;
  @override
  List<PurchaseModel> get purchases {
    if (_purchases is EqualUnmodifiableListView) return _purchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchases);
  }

  @override
  String toString() {
    return 'PurchasesResponseModel(info: $info, purchases: $purchases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasesResponseModel &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other._purchases, _purchases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_purchases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasesResponseModelCopyWith<_$_PurchasesResponseModel> get copyWith =>
      __$$_PurchasesResponseModelCopyWithImpl<_$_PurchasesResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchasesResponseModelToJson(
      this,
    );
  }
}

abstract class _PurchasesResponseModel implements PurchasesResponseModel {
  const factory _PurchasesResponseModel(
          {required final InfoModel info,
          required final List<PurchaseModel> purchases}) =
      _$_PurchasesResponseModel;

  factory _PurchasesResponseModel.fromJson(Map<String, dynamic> json) =
      _$_PurchasesResponseModel.fromJson;

  @override
  InfoModel get info;
  @override
  List<PurchaseModel> get purchases;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasesResponseModelCopyWith<_$_PurchasesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
