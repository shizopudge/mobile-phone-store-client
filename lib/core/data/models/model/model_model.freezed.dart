// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModelModel _$ModelModelFromJson(Map<String, dynamic> json) {
  return _ModelModel.fromJson(json);
}

/// @nodoc
mixin _$ModelModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get pixelDensity => throw _privateConstructorUsedError;
  int get screenRefreshRate => throw _privateConstructorUsedError;
  double get screenDiagonal => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get screenResolution => throw _privateConstructorUsedError;
  OperatingSystem get operatingSystem => throw _privateConstructorUsedError;
  DisplayType get displayType => throw _privateConstructorUsedError;
  ManufacturerModel get manufacturer => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelModelCopyWith<ModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelModelCopyWith<$Res> {
  factory $ModelModelCopyWith(
          ModelModel value, $Res Function(ModelModel) then) =
      _$ModelModelCopyWithImpl<$Res, ModelModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int pixelDensity,
      int screenRefreshRate,
      double screenDiagonal,
      int weight,
      String screenResolution,
      OperatingSystem operatingSystem,
      DisplayType displayType,
      ManufacturerModel manufacturer,
      List<ProductModel> products});

  $ManufacturerModelCopyWith<$Res> get manufacturer;
}

/// @nodoc
class _$ModelModelCopyWithImpl<$Res, $Val extends ModelModel>
    implements $ModelModelCopyWith<$Res> {
  _$ModelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? pixelDensity = null,
    Object? screenRefreshRate = null,
    Object? screenDiagonal = null,
    Object? weight = null,
    Object? screenResolution = null,
    Object? operatingSystem = null,
    Object? displayType = null,
    Object? manufacturer = null,
    Object? products = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pixelDensity: null == pixelDensity
          ? _value.pixelDensity
          : pixelDensity // ignore: cast_nullable_to_non_nullable
              as int,
      screenRefreshRate: null == screenRefreshRate
          ? _value.screenRefreshRate
          : screenRefreshRate // ignore: cast_nullable_to_non_nullable
              as int,
      screenDiagonal: null == screenDiagonal
          ? _value.screenDiagonal
          : screenDiagonal // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      screenResolution: null == screenResolution
          ? _value.screenResolution
          : screenResolution // ignore: cast_nullable_to_non_nullable
              as String,
      operatingSystem: null == operatingSystem
          ? _value.operatingSystem
          : operatingSystem // ignore: cast_nullable_to_non_nullable
              as OperatingSystem,
      displayType: null == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as DisplayType,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as ManufacturerModel,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ManufacturerModelCopyWith<$Res> get manufacturer {
    return $ManufacturerModelCopyWith<$Res>(_value.manufacturer, (value) {
      return _then(_value.copyWith(manufacturer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ModelModelCopyWith<$Res>
    implements $ModelModelCopyWith<$Res> {
  factory _$$_ModelModelCopyWith(
          _$_ModelModel value, $Res Function(_$_ModelModel) then) =
      __$$_ModelModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int pixelDensity,
      int screenRefreshRate,
      double screenDiagonal,
      int weight,
      String screenResolution,
      OperatingSystem operatingSystem,
      DisplayType displayType,
      ManufacturerModel manufacturer,
      List<ProductModel> products});

  @override
  $ManufacturerModelCopyWith<$Res> get manufacturer;
}

/// @nodoc
class __$$_ModelModelCopyWithImpl<$Res>
    extends _$ModelModelCopyWithImpl<$Res, _$_ModelModel>
    implements _$$_ModelModelCopyWith<$Res> {
  __$$_ModelModelCopyWithImpl(
      _$_ModelModel _value, $Res Function(_$_ModelModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? pixelDensity = null,
    Object? screenRefreshRate = null,
    Object? screenDiagonal = null,
    Object? weight = null,
    Object? screenResolution = null,
    Object? operatingSystem = null,
    Object? displayType = null,
    Object? manufacturer = null,
    Object? products = null,
  }) {
    return _then(_$_ModelModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pixelDensity: null == pixelDensity
          ? _value.pixelDensity
          : pixelDensity // ignore: cast_nullable_to_non_nullable
              as int,
      screenRefreshRate: null == screenRefreshRate
          ? _value.screenRefreshRate
          : screenRefreshRate // ignore: cast_nullable_to_non_nullable
              as int,
      screenDiagonal: null == screenDiagonal
          ? _value.screenDiagonal
          : screenDiagonal // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      screenResolution: null == screenResolution
          ? _value.screenResolution
          : screenResolution // ignore: cast_nullable_to_non_nullable
              as String,
      operatingSystem: null == operatingSystem
          ? _value.operatingSystem
          : operatingSystem // ignore: cast_nullable_to_non_nullable
              as OperatingSystem,
      displayType: null == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as DisplayType,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as ManufacturerModel,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelModel extends _ModelModel {
  const _$_ModelModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.pixelDensity,
      required this.screenRefreshRate,
      required this.screenDiagonal,
      required this.weight,
      required this.screenResolution,
      required this.operatingSystem,
      required this.displayType,
      required this.manufacturer,
      required final List<ProductModel> products})
      : _products = products,
        super._();

  factory _$_ModelModel.fromJson(Map<String, dynamic> json) =>
      _$$_ModelModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int pixelDensity;
  @override
  final int screenRefreshRate;
  @override
  final double screenDiagonal;
  @override
  final int weight;
  @override
  final String screenResolution;
  @override
  final OperatingSystem operatingSystem;
  @override
  final DisplayType displayType;
  @override
  final ManufacturerModel manufacturer;
  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ModelModel(id: $id, name: $name, description: $description, pixelDensity: $pixelDensity, screenRefreshRate: $screenRefreshRate, screenDiagonal: $screenDiagonal, weight: $weight, screenResolution: $screenResolution, operatingSystem: $operatingSystem, displayType: $displayType, manufacturer: $manufacturer, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pixelDensity, pixelDensity) ||
                other.pixelDensity == pixelDensity) &&
            (identical(other.screenRefreshRate, screenRefreshRate) ||
                other.screenRefreshRate == screenRefreshRate) &&
            (identical(other.screenDiagonal, screenDiagonal) ||
                other.screenDiagonal == screenDiagonal) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.screenResolution, screenResolution) ||
                other.screenResolution == screenResolution) &&
            (identical(other.operatingSystem, operatingSystem) ||
                other.operatingSystem == operatingSystem) &&
            (identical(other.displayType, displayType) ||
                other.displayType == displayType) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      pixelDensity,
      screenRefreshRate,
      screenDiagonal,
      weight,
      screenResolution,
      operatingSystem,
      displayType,
      manufacturer,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModelModelCopyWith<_$_ModelModel> get copyWith =>
      __$$_ModelModelCopyWithImpl<_$_ModelModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelModelToJson(
      this,
    );
  }
}

abstract class _ModelModel extends ModelModel {
  const factory _ModelModel(
      {required final String id,
      required final String name,
      required final String description,
      required final int pixelDensity,
      required final int screenRefreshRate,
      required final double screenDiagonal,
      required final int weight,
      required final String screenResolution,
      required final OperatingSystem operatingSystem,
      required final DisplayType displayType,
      required final ManufacturerModel manufacturer,
      required final List<ProductModel> products}) = _$_ModelModel;
  const _ModelModel._() : super._();

  factory _ModelModel.fromJson(Map<String, dynamic> json) =
      _$_ModelModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get pixelDensity;
  @override
  int get screenRefreshRate;
  @override
  double get screenDiagonal;
  @override
  int get weight;
  @override
  String get screenResolution;
  @override
  OperatingSystem get operatingSystem;
  @override
  DisplayType get displayType;
  @override
  ManufacturerModel get manufacturer;
  @override
  List<ProductModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$_ModelModelCopyWith<_$_ModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}
