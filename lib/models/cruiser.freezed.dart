// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cruiser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cruiser _$CruiserFromJson(Map<String, dynamic> json) {
  return _Cruiser.fromJson(json);
}

/// @nodoc
mixin _$Cruiser {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get defaultImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CruiserCopyWith<Cruiser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CruiserCopyWith<$Res> {
  factory $CruiserCopyWith(Cruiser value, $Res Function(Cruiser) then) =
      _$CruiserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String type,
      int capacity,
      String description,
      String defaultImage});
}

/// @nodoc
class _$CruiserCopyWithImpl<$Res> implements $CruiserCopyWith<$Res> {
  _$CruiserCopyWithImpl(this._value, this._then);

  final Cruiser _value;
  // ignore: unused_field
  final $Res Function(Cruiser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? capacity = freezed,
    Object? description = freezed,
    Object? defaultImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: capacity == freezed
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      defaultImage: defaultImage == freezed
          ? _value.defaultImage
          : defaultImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CruiserCopyWith<$Res> implements $CruiserCopyWith<$Res> {
  factory _$CruiserCopyWith(_Cruiser value, $Res Function(_Cruiser) then) =
      __$CruiserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String type,
      int capacity,
      String description,
      String defaultImage});
}

/// @nodoc
class __$CruiserCopyWithImpl<$Res> extends _$CruiserCopyWithImpl<$Res>
    implements _$CruiserCopyWith<$Res> {
  __$CruiserCopyWithImpl(_Cruiser _value, $Res Function(_Cruiser) _then)
      : super(_value, (v) => _then(v as _Cruiser));

  @override
  _Cruiser get _value => super._value as _Cruiser;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? capacity = freezed,
    Object? description = freezed,
    Object? defaultImage = freezed,
  }) {
    return _then(_Cruiser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: capacity == freezed
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      defaultImage: defaultImage == freezed
          ? _value.defaultImage
          : defaultImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cruiser with DiagnosticableTreeMixin implements _Cruiser {
  const _$_Cruiser(
      {required this.id,
      required this.title,
      required this.type,
      this.capacity = 0,
      this.description = "",
      this.defaultImage = ""});

  factory _$_Cruiser.fromJson(Map<String, dynamic> json) =>
      _$$_CruiserFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  @override
  @JsonKey()
  final int capacity;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String defaultImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Cruiser(id: $id, title: $title, type: $type, capacity: $capacity, description: $description, defaultImage: $defaultImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Cruiser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('capacity', capacity))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('defaultImage', defaultImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cruiser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.capacity, capacity) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.defaultImage, defaultImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(capacity),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(defaultImage));

  @JsonKey(ignore: true)
  @override
  _$CruiserCopyWith<_Cruiser> get copyWith =>
      __$CruiserCopyWithImpl<_Cruiser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CruiserToJson(this);
  }
}

abstract class _Cruiser implements Cruiser {
  const factory _Cruiser(
      {required final String id,
      required final String title,
      required final String type,
      final int capacity,
      final String description,
      final String defaultImage}) = _$_Cruiser;

  factory _Cruiser.fromJson(Map<String, dynamic> json) = _$_Cruiser.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  int get capacity => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get defaultImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CruiserCopyWith<_Cruiser> get copyWith =>
      throw _privateConstructorUsedError;
}
