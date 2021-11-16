// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MedicalTearOff {
  const _$MedicalTearOff();

  _Medical call(
      {required int id,
      required String date,
      required String time,
      required String name,
      required String description}) {
    return _Medical(
      id: id,
      date: date,
      time: time,
      name: name,
      description: description,
    );
  }
}

/// @nodoc
const $Medical = _$MedicalTearOff();

/// @nodoc
mixin _$Medical {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MedicalCopyWith<Medical> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalCopyWith<$Res> {
  factory $MedicalCopyWith(Medical value, $Res Function(Medical) then) =
      _$MedicalCopyWithImpl<$Res>;
  $Res call(
      {int id, String date, String time, String name, String description});
}

/// @nodoc
class _$MedicalCopyWithImpl<$Res> implements $MedicalCopyWith<$Res> {
  _$MedicalCopyWithImpl(this._value, this._then);

  final Medical _value;
  // ignore: unused_field
  final $Res Function(Medical) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MedicalCopyWith<$Res> implements $MedicalCopyWith<$Res> {
  factory _$MedicalCopyWith(_Medical value, $Res Function(_Medical) then) =
      __$MedicalCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String date, String time, String name, String description});
}

/// @nodoc
class __$MedicalCopyWithImpl<$Res> extends _$MedicalCopyWithImpl<$Res>
    implements _$MedicalCopyWith<$Res> {
  __$MedicalCopyWithImpl(_Medical _value, $Res Function(_Medical) _then)
      : super(_value, (v) => _then(v as _Medical));

  @override
  _Medical get _value => super._value as _Medical;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_Medical(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Medical with DiagnosticableTreeMixin implements _Medical {
  _$_Medical(
      {required this.id,
      required this.date,
      required this.time,
      required this.name,
      required this.description});

  @override
  final int id;
  @override
  final String date;
  @override
  final String time;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Medical(id: $id, date: $date, time: $time, name: $name, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Medical'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Medical &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, time, name, description);

  @JsonKey(ignore: true)
  @override
  _$MedicalCopyWith<_Medical> get copyWith =>
      __$MedicalCopyWithImpl<_Medical>(this, _$identity);
}

abstract class _Medical implements Medical {
  factory _Medical(
      {required int id,
      required String date,
      required String time,
      required String name,
      required String description}) = _$_Medical;

  @override
  int get id;
  @override
  String get date;
  @override
  String get time;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$MedicalCopyWith<_Medical> get copyWith =>
      throw _privateConstructorUsedError;
}
