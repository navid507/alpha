// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_type_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecordTypesResultTearOff {
  const _$RecordTypesResultTearOff();

  SuccessRecordTypes success(List<RecordType> recordTypes) {
    return SuccessRecordTypes(
      recordTypes,
    );
  }

  ErrorRecordTypes error(int code, String msg) {
    return ErrorRecordTypes(
      code,
      msg,
    );
  }
}

/// @nodoc
const $RecordTypesResult = _$RecordTypesResultTearOff();

/// @nodoc
mixin _$RecordTypesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<RecordType> recordTypes) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<RecordType> recordTypes)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RecordType> recordTypes)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRecordTypes value) success,
    required TResult Function(ErrorRecordTypes value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRecordTypes value)? success,
    TResult Function(ErrorRecordTypes value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRecordTypes value)? success,
    TResult Function(ErrorRecordTypes value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordTypesResultCopyWith<$Res> {
  factory $RecordTypesResultCopyWith(
          RecordTypesResult value, $Res Function(RecordTypesResult) then) =
      _$RecordTypesResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecordTypesResultCopyWithImpl<$Res>
    implements $RecordTypesResultCopyWith<$Res> {
  _$RecordTypesResultCopyWithImpl(this._value, this._then);

  final RecordTypesResult _value;
  // ignore: unused_field
  final $Res Function(RecordTypesResult) _then;
}

/// @nodoc
abstract class $SuccessRecordTypesCopyWith<$Res> {
  factory $SuccessRecordTypesCopyWith(
          SuccessRecordTypes value, $Res Function(SuccessRecordTypes) then) =
      _$SuccessRecordTypesCopyWithImpl<$Res>;
  $Res call({List<RecordType> recordTypes});
}

/// @nodoc
class _$SuccessRecordTypesCopyWithImpl<$Res>
    extends _$RecordTypesResultCopyWithImpl<$Res>
    implements $SuccessRecordTypesCopyWith<$Res> {
  _$SuccessRecordTypesCopyWithImpl(
      SuccessRecordTypes _value, $Res Function(SuccessRecordTypes) _then)
      : super(_value, (v) => _then(v as SuccessRecordTypes));

  @override
  SuccessRecordTypes get _value => super._value as SuccessRecordTypes;

  @override
  $Res call({
    Object? recordTypes = freezed,
  }) {
    return _then(SuccessRecordTypes(
      recordTypes == freezed
          ? _value.recordTypes
          : recordTypes // ignore: cast_nullable_to_non_nullable
              as List<RecordType>,
    ));
  }
}

/// @nodoc

class _$SuccessRecordTypes
    with DiagnosticableTreeMixin
    implements SuccessRecordTypes {
  const _$SuccessRecordTypes(this.recordTypes);

  @override
  final List<RecordType> recordTypes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecordTypesResult.success(recordTypes: $recordTypes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecordTypesResult.success'))
      ..add(DiagnosticsProperty('recordTypes', recordTypes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessRecordTypes &&
            const DeepCollectionEquality()
                .equals(other.recordTypes, recordTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(recordTypes));

  @JsonKey(ignore: true)
  @override
  $SuccessRecordTypesCopyWith<SuccessRecordTypes> get copyWith =>
      _$SuccessRecordTypesCopyWithImpl<SuccessRecordTypes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<RecordType> recordTypes) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(recordTypes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<RecordType> recordTypes)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(recordTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RecordType> recordTypes)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(recordTypes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRecordTypes value) success,
    required TResult Function(ErrorRecordTypes value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRecordTypes value)? success,
    TResult Function(ErrorRecordTypes value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRecordTypes value)? success,
    TResult Function(ErrorRecordTypes value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessRecordTypes implements RecordTypesResult {
  const factory SuccessRecordTypes(List<RecordType> recordTypes) =
      _$SuccessRecordTypes;

  List<RecordType> get recordTypes;
  @JsonKey(ignore: true)
  $SuccessRecordTypesCopyWith<SuccessRecordTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorRecordTypesCopyWith<$Res> {
  factory $ErrorRecordTypesCopyWith(
          ErrorRecordTypes value, $Res Function(ErrorRecordTypes) then) =
      _$ErrorRecordTypesCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorRecordTypesCopyWithImpl<$Res>
    extends _$RecordTypesResultCopyWithImpl<$Res>
    implements $ErrorRecordTypesCopyWith<$Res> {
  _$ErrorRecordTypesCopyWithImpl(
      ErrorRecordTypes _value, $Res Function(ErrorRecordTypes) _then)
      : super(_value, (v) => _then(v as ErrorRecordTypes));

  @override
  ErrorRecordTypes get _value => super._value as ErrorRecordTypes;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorRecordTypes(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorRecordTypes
    with DiagnosticableTreeMixin
    implements ErrorRecordTypes {
  const _$ErrorRecordTypes(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecordTypesResult.error(code: $code, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecordTypesResult.error'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorRecordTypes &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorRecordTypesCopyWith<ErrorRecordTypes> get copyWith =>
      _$ErrorRecordTypesCopyWithImpl<ErrorRecordTypes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<RecordType> recordTypes) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<RecordType> recordTypes)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RecordType> recordTypes)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(code, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRecordTypes value) success,
    required TResult Function(ErrorRecordTypes value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRecordTypes value)? success,
    TResult Function(ErrorRecordTypes value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRecordTypes value)? success,
    TResult Function(ErrorRecordTypes value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorRecordTypes implements RecordTypesResult {
  const factory ErrorRecordTypes(int code, String msg) = _$ErrorRecordTypes;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorRecordTypesCopyWith<ErrorRecordTypes> get copyWith =>
      throw _privateConstructorUsedError;
}
