// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_edit_manufacturer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateEditManufacturerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Manufacturer manufacturer) setManufacturer,
    required TResult Function(String name) changeName,
    required TResult Function() createManufacturer,
    required TResult Function() editManufacturer,
    required TResult Function() pickImage,
    required TResult Function() deleteImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Manufacturer manufacturer)? setManufacturer,
    TResult? Function(String name)? changeName,
    TResult? Function()? createManufacturer,
    TResult? Function()? editManufacturer,
    TResult? Function()? pickImage,
    TResult? Function()? deleteImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Manufacturer manufacturer)? setManufacturer,
    TResult Function(String name)? changeName,
    TResult Function()? createManufacturer,
    TResult Function()? editManufacturer,
    TResult Function()? pickImage,
    TResult Function()? deleteImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetManufacturer value) setManufacturer,
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_CreateManufacturer value) createManufacturer,
    required TResult Function(_EditManufacturer value) editManufacturer,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_DeleteImage value) deleteImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetManufacturer value)? setManufacturer,
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_CreateManufacturer value)? createManufacturer,
    TResult? Function(_EditManufacturer value)? editManufacturer,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_DeleteImage value)? deleteImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetManufacturer value)? setManufacturer,
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_CreateManufacturer value)? createManufacturer,
    TResult Function(_EditManufacturer value)? editManufacturer,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEditManufacturerEventCopyWith<$Res> {
  factory $CreateEditManufacturerEventCopyWith(
          CreateEditManufacturerEvent value,
          $Res Function(CreateEditManufacturerEvent) then) =
      _$CreateEditManufacturerEventCopyWithImpl<$Res,
          CreateEditManufacturerEvent>;
}

/// @nodoc
class _$CreateEditManufacturerEventCopyWithImpl<$Res,
        $Val extends CreateEditManufacturerEvent>
    implements $CreateEditManufacturerEventCopyWith<$Res> {
  _$CreateEditManufacturerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SetManufacturerCopyWith<$Res> {
  factory _$$_SetManufacturerCopyWith(
          _$_SetManufacturer value, $Res Function(_$_SetManufacturer) then) =
      __$$_SetManufacturerCopyWithImpl<$Res>;
  @useResult
  $Res call({Manufacturer manufacturer});
}

/// @nodoc
class __$$_SetManufacturerCopyWithImpl<$Res>
    extends _$CreateEditManufacturerEventCopyWithImpl<$Res, _$_SetManufacturer>
    implements _$$_SetManufacturerCopyWith<$Res> {
  __$$_SetManufacturerCopyWithImpl(
      _$_SetManufacturer _value, $Res Function(_$_SetManufacturer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufacturer = null,
  }) {
    return _then(_$_SetManufacturer(
      null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as Manufacturer,
    ));
  }
}

/// @nodoc

class _$_SetManufacturer implements _SetManufacturer {
  const _$_SetManufacturer(this.manufacturer);

  @override
  final Manufacturer manufacturer;

  @override
  String toString() {
    return 'CreateEditManufacturerEvent.setManufacturer(manufacturer: $manufacturer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetManufacturer &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, manufacturer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetManufacturerCopyWith<_$_SetManufacturer> get copyWith =>
      __$$_SetManufacturerCopyWithImpl<_$_SetManufacturer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Manufacturer manufacturer) setManufacturer,
    required TResult Function(String name) changeName,
    required TResult Function() createManufacturer,
    required TResult Function() editManufacturer,
    required TResult Function() pickImage,
    required TResult Function() deleteImage,
  }) {
    return setManufacturer(manufacturer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Manufacturer manufacturer)? setManufacturer,
    TResult? Function(String name)? changeName,
    TResult? Function()? createManufacturer,
    TResult? Function()? editManufacturer,
    TResult? Function()? pickImage,
    TResult? Function()? deleteImage,
  }) {
    return setManufacturer?.call(manufacturer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Manufacturer manufacturer)? setManufacturer,
    TResult Function(String name)? changeName,
    TResult Function()? createManufacturer,
    TResult Function()? editManufacturer,
    TResult Function()? pickImage,
    TResult Function()? deleteImage,
    required TResult orElse(),
  }) {
    if (setManufacturer != null) {
      return setManufacturer(manufacturer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetManufacturer value) setManufacturer,
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_CreateManufacturer value) createManufacturer,
    required TResult Function(_EditManufacturer value) editManufacturer,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_DeleteImage value) deleteImage,
  }) {
    return setManufacturer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetManufacturer value)? setManufacturer,
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_CreateManufacturer value)? createManufacturer,
    TResult? Function(_EditManufacturer value)? editManufacturer,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_DeleteImage value)? deleteImage,
  }) {
    return setManufacturer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetManufacturer value)? setManufacturer,
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_CreateManufacturer value)? createManufacturer,
    TResult Function(_EditManufacturer value)? editManufacturer,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (setManufacturer != null) {
      return setManufacturer(this);
    }
    return orElse();
  }
}

abstract class _SetManufacturer implements CreateEditManufacturerEvent {
  const factory _SetManufacturer(final Manufacturer manufacturer) =
      _$_SetManufacturer;

  Manufacturer get manufacturer;
  @JsonKey(ignore: true)
  _$$_SetManufacturerCopyWith<_$_SetManufacturer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeNameCopyWith<$Res> {
  factory _$$_ChangeNameCopyWith(
          _$_ChangeName value, $Res Function(_$_ChangeName) then) =
      __$$_ChangeNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_ChangeNameCopyWithImpl<$Res>
    extends _$CreateEditManufacturerEventCopyWithImpl<$Res, _$_ChangeName>
    implements _$$_ChangeNameCopyWith<$Res> {
  __$$_ChangeNameCopyWithImpl(
      _$_ChangeName _value, $Res Function(_$_ChangeName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_ChangeName(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeName implements _ChangeName {
  const _$_ChangeName(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'CreateEditManufacturerEvent.changeName(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeName &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeNameCopyWith<_$_ChangeName> get copyWith =>
      __$$_ChangeNameCopyWithImpl<_$_ChangeName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Manufacturer manufacturer) setManufacturer,
    required TResult Function(String name) changeName,
    required TResult Function() createManufacturer,
    required TResult Function() editManufacturer,
    required TResult Function() pickImage,
    required TResult Function() deleteImage,
  }) {
    return changeName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Manufacturer manufacturer)? setManufacturer,
    TResult? Function(String name)? changeName,
    TResult? Function()? createManufacturer,
    TResult? Function()? editManufacturer,
    TResult? Function()? pickImage,
    TResult? Function()? deleteImage,
  }) {
    return changeName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Manufacturer manufacturer)? setManufacturer,
    TResult Function(String name)? changeName,
    TResult Function()? createManufacturer,
    TResult Function()? editManufacturer,
    TResult Function()? pickImage,
    TResult Function()? deleteImage,
    required TResult orElse(),
  }) {
    if (changeName != null) {
      return changeName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetManufacturer value) setManufacturer,
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_CreateManufacturer value) createManufacturer,
    required TResult Function(_EditManufacturer value) editManufacturer,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_DeleteImage value) deleteImage,
  }) {
    return changeName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetManufacturer value)? setManufacturer,
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_CreateManufacturer value)? createManufacturer,
    TResult? Function(_EditManufacturer value)? editManufacturer,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_DeleteImage value)? deleteImage,
  }) {
    return changeName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetManufacturer value)? setManufacturer,
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_CreateManufacturer value)? createManufacturer,
    TResult Function(_EditManufacturer value)? editManufacturer,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (changeName != null) {
      return changeName(this);
    }
    return orElse();
  }
}

abstract class _ChangeName implements CreateEditManufacturerEvent {
  const factory _ChangeName(final String name) = _$_ChangeName;

  String get name;
  @JsonKey(ignore: true)
  _$$_ChangeNameCopyWith<_$_ChangeName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateManufacturerCopyWith<$Res> {
  factory _$$_CreateManufacturerCopyWith(_$_CreateManufacturer value,
          $Res Function(_$_CreateManufacturer) then) =
      __$$_CreateManufacturerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateManufacturerCopyWithImpl<$Res>
    extends _$CreateEditManufacturerEventCopyWithImpl<$Res,
        _$_CreateManufacturer> implements _$$_CreateManufacturerCopyWith<$Res> {
  __$$_CreateManufacturerCopyWithImpl(
      _$_CreateManufacturer _value, $Res Function(_$_CreateManufacturer) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CreateManufacturer implements _CreateManufacturer {
  const _$_CreateManufacturer();

  @override
  String toString() {
    return 'CreateEditManufacturerEvent.createManufacturer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CreateManufacturer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Manufacturer manufacturer) setManufacturer,
    required TResult Function(String name) changeName,
    required TResult Function() createManufacturer,
    required TResult Function() editManufacturer,
    required TResult Function() pickImage,
    required TResult Function() deleteImage,
  }) {
    return createManufacturer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Manufacturer manufacturer)? setManufacturer,
    TResult? Function(String name)? changeName,
    TResult? Function()? createManufacturer,
    TResult? Function()? editManufacturer,
    TResult? Function()? pickImage,
    TResult? Function()? deleteImage,
  }) {
    return createManufacturer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Manufacturer manufacturer)? setManufacturer,
    TResult Function(String name)? changeName,
    TResult Function()? createManufacturer,
    TResult Function()? editManufacturer,
    TResult Function()? pickImage,
    TResult Function()? deleteImage,
    required TResult orElse(),
  }) {
    if (createManufacturer != null) {
      return createManufacturer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetManufacturer value) setManufacturer,
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_CreateManufacturer value) createManufacturer,
    required TResult Function(_EditManufacturer value) editManufacturer,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_DeleteImage value) deleteImage,
  }) {
    return createManufacturer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetManufacturer value)? setManufacturer,
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_CreateManufacturer value)? createManufacturer,
    TResult? Function(_EditManufacturer value)? editManufacturer,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_DeleteImage value)? deleteImage,
  }) {
    return createManufacturer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetManufacturer value)? setManufacturer,
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_CreateManufacturer value)? createManufacturer,
    TResult Function(_EditManufacturer value)? editManufacturer,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (createManufacturer != null) {
      return createManufacturer(this);
    }
    return orElse();
  }
}

abstract class _CreateManufacturer implements CreateEditManufacturerEvent {
  const factory _CreateManufacturer() = _$_CreateManufacturer;
}

/// @nodoc
abstract class _$$_EditManufacturerCopyWith<$Res> {
  factory _$$_EditManufacturerCopyWith(
          _$_EditManufacturer value, $Res Function(_$_EditManufacturer) then) =
      __$$_EditManufacturerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EditManufacturerCopyWithImpl<$Res>
    extends _$CreateEditManufacturerEventCopyWithImpl<$Res, _$_EditManufacturer>
    implements _$$_EditManufacturerCopyWith<$Res> {
  __$$_EditManufacturerCopyWithImpl(
      _$_EditManufacturer _value, $Res Function(_$_EditManufacturer) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EditManufacturer implements _EditManufacturer {
  const _$_EditManufacturer();

  @override
  String toString() {
    return 'CreateEditManufacturerEvent.editManufacturer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EditManufacturer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Manufacturer manufacturer) setManufacturer,
    required TResult Function(String name) changeName,
    required TResult Function() createManufacturer,
    required TResult Function() editManufacturer,
    required TResult Function() pickImage,
    required TResult Function() deleteImage,
  }) {
    return editManufacturer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Manufacturer manufacturer)? setManufacturer,
    TResult? Function(String name)? changeName,
    TResult? Function()? createManufacturer,
    TResult? Function()? editManufacturer,
    TResult? Function()? pickImage,
    TResult? Function()? deleteImage,
  }) {
    return editManufacturer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Manufacturer manufacturer)? setManufacturer,
    TResult Function(String name)? changeName,
    TResult Function()? createManufacturer,
    TResult Function()? editManufacturer,
    TResult Function()? pickImage,
    TResult Function()? deleteImage,
    required TResult orElse(),
  }) {
    if (editManufacturer != null) {
      return editManufacturer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetManufacturer value) setManufacturer,
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_CreateManufacturer value) createManufacturer,
    required TResult Function(_EditManufacturer value) editManufacturer,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_DeleteImage value) deleteImage,
  }) {
    return editManufacturer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetManufacturer value)? setManufacturer,
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_CreateManufacturer value)? createManufacturer,
    TResult? Function(_EditManufacturer value)? editManufacturer,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_DeleteImage value)? deleteImage,
  }) {
    return editManufacturer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetManufacturer value)? setManufacturer,
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_CreateManufacturer value)? createManufacturer,
    TResult Function(_EditManufacturer value)? editManufacturer,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (editManufacturer != null) {
      return editManufacturer(this);
    }
    return orElse();
  }
}

abstract class _EditManufacturer implements CreateEditManufacturerEvent {
  const factory _EditManufacturer() = _$_EditManufacturer;
}

/// @nodoc
abstract class _$$_PickImageCopyWith<$Res> {
  factory _$$_PickImageCopyWith(
          _$_PickImage value, $Res Function(_$_PickImage) then) =
      __$$_PickImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PickImageCopyWithImpl<$Res>
    extends _$CreateEditManufacturerEventCopyWithImpl<$Res, _$_PickImage>
    implements _$$_PickImageCopyWith<$Res> {
  __$$_PickImageCopyWithImpl(
      _$_PickImage _value, $Res Function(_$_PickImage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PickImage implements _PickImage {
  const _$_PickImage();

  @override
  String toString() {
    return 'CreateEditManufacturerEvent.pickImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PickImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Manufacturer manufacturer) setManufacturer,
    required TResult Function(String name) changeName,
    required TResult Function() createManufacturer,
    required TResult Function() editManufacturer,
    required TResult Function() pickImage,
    required TResult Function() deleteImage,
  }) {
    return pickImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Manufacturer manufacturer)? setManufacturer,
    TResult? Function(String name)? changeName,
    TResult? Function()? createManufacturer,
    TResult? Function()? editManufacturer,
    TResult? Function()? pickImage,
    TResult? Function()? deleteImage,
  }) {
    return pickImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Manufacturer manufacturer)? setManufacturer,
    TResult Function(String name)? changeName,
    TResult Function()? createManufacturer,
    TResult Function()? editManufacturer,
    TResult Function()? pickImage,
    TResult Function()? deleteImage,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetManufacturer value) setManufacturer,
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_CreateManufacturer value) createManufacturer,
    required TResult Function(_EditManufacturer value) editManufacturer,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_DeleteImage value) deleteImage,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetManufacturer value)? setManufacturer,
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_CreateManufacturer value)? createManufacturer,
    TResult? Function(_EditManufacturer value)? editManufacturer,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_DeleteImage value)? deleteImage,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetManufacturer value)? setManufacturer,
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_CreateManufacturer value)? createManufacturer,
    TResult Function(_EditManufacturer value)? editManufacturer,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(this);
    }
    return orElse();
  }
}

abstract class _PickImage implements CreateEditManufacturerEvent {
  const factory _PickImage() = _$_PickImage;
}

/// @nodoc
abstract class _$$_DeleteImageCopyWith<$Res> {
  factory _$$_DeleteImageCopyWith(
          _$_DeleteImage value, $Res Function(_$_DeleteImage) then) =
      __$$_DeleteImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteImageCopyWithImpl<$Res>
    extends _$CreateEditManufacturerEventCopyWithImpl<$Res, _$_DeleteImage>
    implements _$$_DeleteImageCopyWith<$Res> {
  __$$_DeleteImageCopyWithImpl(
      _$_DeleteImage _value, $Res Function(_$_DeleteImage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteImage implements _DeleteImage {
  const _$_DeleteImage();

  @override
  String toString() {
    return 'CreateEditManufacturerEvent.deleteImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Manufacturer manufacturer) setManufacturer,
    required TResult Function(String name) changeName,
    required TResult Function() createManufacturer,
    required TResult Function() editManufacturer,
    required TResult Function() pickImage,
    required TResult Function() deleteImage,
  }) {
    return deleteImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Manufacturer manufacturer)? setManufacturer,
    TResult? Function(String name)? changeName,
    TResult? Function()? createManufacturer,
    TResult? Function()? editManufacturer,
    TResult? Function()? pickImage,
    TResult? Function()? deleteImage,
  }) {
    return deleteImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Manufacturer manufacturer)? setManufacturer,
    TResult Function(String name)? changeName,
    TResult Function()? createManufacturer,
    TResult Function()? editManufacturer,
    TResult Function()? pickImage,
    TResult Function()? deleteImage,
    required TResult orElse(),
  }) {
    if (deleteImage != null) {
      return deleteImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetManufacturer value) setManufacturer,
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_CreateManufacturer value) createManufacturer,
    required TResult Function(_EditManufacturer value) editManufacturer,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_DeleteImage value) deleteImage,
  }) {
    return deleteImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetManufacturer value)? setManufacturer,
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_CreateManufacturer value)? createManufacturer,
    TResult? Function(_EditManufacturer value)? editManufacturer,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_DeleteImage value)? deleteImage,
  }) {
    return deleteImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetManufacturer value)? setManufacturer,
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_CreateManufacturer value)? createManufacturer,
    TResult Function(_EditManufacturer value)? editManufacturer,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (deleteImage != null) {
      return deleteImage(this);
    }
    return orElse();
  }
}

abstract class _DeleteImage implements CreateEditManufacturerEvent {
  const factory _DeleteImage() = _$_DeleteImage;
}

/// @nodoc
mixin _$CreateEditManufacturerState {
  String get name => throw _privateConstructorUsedError;
  CreateEditManufacturerStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  Manufacturer? get manufacturer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateEditManufacturerStateCopyWith<CreateEditManufacturerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEditManufacturerStateCopyWith<$Res> {
  factory $CreateEditManufacturerStateCopyWith(
          CreateEditManufacturerState value,
          $Res Function(CreateEditManufacturerState) then) =
      _$CreateEditManufacturerStateCopyWithImpl<$Res,
          CreateEditManufacturerState>;
  @useResult
  $Res call(
      {String name,
      CreateEditManufacturerStatus status,
      Failure failure,
      File? image,
      Manufacturer? manufacturer});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$CreateEditManufacturerStateCopyWithImpl<$Res,
        $Val extends CreateEditManufacturerState>
    implements $CreateEditManufacturerStateCopyWith<$Res> {
  _$CreateEditManufacturerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? status = null,
    Object? failure = null,
    Object? image = freezed,
    Object? manufacturer = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateEditManufacturerStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as Manufacturer?,
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
abstract class _$$_CreateEditManufacturerStateCopyWith<$Res>
    implements $CreateEditManufacturerStateCopyWith<$Res> {
  factory _$$_CreateEditManufacturerStateCopyWith(
          _$_CreateEditManufacturerState value,
          $Res Function(_$_CreateEditManufacturerState) then) =
      __$$_CreateEditManufacturerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      CreateEditManufacturerStatus status,
      Failure failure,
      File? image,
      Manufacturer? manufacturer});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_CreateEditManufacturerStateCopyWithImpl<$Res>
    extends _$CreateEditManufacturerStateCopyWithImpl<$Res,
        _$_CreateEditManufacturerState>
    implements _$$_CreateEditManufacturerStateCopyWith<$Res> {
  __$$_CreateEditManufacturerStateCopyWithImpl(
      _$_CreateEditManufacturerState _value,
      $Res Function(_$_CreateEditManufacturerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? status = null,
    Object? failure = null,
    Object? image = freezed,
    Object? manufacturer = freezed,
  }) {
    return _then(_$_CreateEditManufacturerState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateEditManufacturerStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as Manufacturer?,
    ));
  }
}

/// @nodoc

class _$_CreateEditManufacturerState extends _CreateEditManufacturerState {
  const _$_CreateEditManufacturerState(
      {this.name = '',
      this.status = CreateEditManufacturerStatus.initial,
      this.failure = const CasualFailure(),
      this.image,
      this.manufacturer})
      : super._();

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final CreateEditManufacturerStatus status;
  @override
  @JsonKey()
  final Failure failure;
  @override
  final File? image;
  @override
  final Manufacturer? manufacturer;

  @override
  String toString() {
    return 'CreateEditManufacturerState(name: $name, status: $status, failure: $failure, image: $image, manufacturer: $manufacturer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateEditManufacturerState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, status, failure, image, manufacturer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateEditManufacturerStateCopyWith<_$_CreateEditManufacturerState>
      get copyWith => __$$_CreateEditManufacturerStateCopyWithImpl<
          _$_CreateEditManufacturerState>(this, _$identity);
}

abstract class _CreateEditManufacturerState
    extends CreateEditManufacturerState {
  const factory _CreateEditManufacturerState(
      {final String name,
      final CreateEditManufacturerStatus status,
      final Failure failure,
      final File? image,
      final Manufacturer? manufacturer}) = _$_CreateEditManufacturerState;
  const _CreateEditManufacturerState._() : super._();

  @override
  String get name;
  @override
  CreateEditManufacturerStatus get status;
  @override
  Failure get failure;
  @override
  File? get image;
  @override
  Manufacturer? get manufacturer;
  @override
  @JsonKey(ignore: true)
  _$$_CreateEditManufacturerStateCopyWith<_$_CreateEditManufacturerState>
      get copyWith => throw _privateConstructorUsedError;
}
