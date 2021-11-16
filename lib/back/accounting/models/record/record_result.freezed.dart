// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecordsResultTearOff {
  const _$RecordsResultTearOff();

  SuccessRecords success(List<Record> records) {
    return SuccessRecords(
      records,
    );
  }

  ErrorRecords error(int code, String msg) {
    return ErrorRecords(
      code,
      msg,
    );
  }
}

/// @nodoc
const $RecordsResult = _$RecordsResultTearOff();

/// @nodoc
mixin _$RecordsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Record> records) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Record> records)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Record> records)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRecords value) success,
    required TResult Function(ErrorRecords value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRecords value)? success,
    TResult Function(ErrorRecords value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRecords value)? success,
    TResult Function(ErrorRecords value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsResultCopyWith<$Res> {
  factory $RecordsResultCopyWith(
          RecordsResult value, $Res Function(RecordsResult) then) =
      _$RecordsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecordsResultCopyWithImpl<$Res>
    implements $RecordsResultCopyWith<$Res> {
  _$RecordsResultCopyWithImpl(this._value, this._then);

  final RecordsResult _value;
  // ignore: unused_field
  final $Res Function(RecordsResult) _then;
}

/// @nodoc
abstract class $SuccessRecordsCopyWith<$Res> {
  factory $SuccessRecordsCopyWith(
          SuccessRecords value, $Res Function(SuccessRecords) then) =
      _$SuccessRecordsCopyWithImpl<$Res>;
  $Res call({List<Record> records});
}

/// @nodoc
class _$SuccessRecordsCopyWithImpl<$Res>
    extends _$RecordsResultCopyWithImpl<$Res>
    implements $SuccessRecordsCopyWith<$Res> {
  _$SuccessRecordsCopyWithImpl(
      SuccessRecords _value, $Res Function(SuccessRecords) _then)
      : super(_value, (v) => _then(v as SuccessRecords));

  @override
  SuccessRecords get _value => super._value as SuccessRecords;

  @override
  $Res call({
    Object? records = freezed,
  }) {
    return _then(SuccessRecords(
      records == freezed
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<Record>,
    ));
  }
}

/// @nodoc

class _$SuccessRecords implements SuccessRecords {
  const _$SuccessRecords(this.records);

  @override
  final List<Record> records;

  @override
  String toString() {
    return 'RecordsResult.success(records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessRecords &&
            const DeepCollectionEquality().equals(other.records, records));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(records));

  @JsonKey(ignore: true)
  @override
  $SuccessRecordsCopyWith<SuccessRecords> get copyWith =>
      _$SuccessRecordsCopyWithImpl<SuccessRecords>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Record> records) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(records);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Record> records)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(records);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Record> records)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(records);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRecords value) success,
    required TResult Function(ErrorRecords value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRecords value)? success,
    TResult Function(ErrorRecords value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRecords value)? success,
    TResult Function(ErrorRecords value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessRecords implements RecordsResult {
  const factory SuccessRecords(List<Record> records) = _$SuccessRecords;

  List<Record> get records;
  @JsonKey(ignore: true)
  $SuccessRecordsCopyWith<SuccessRecords> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorRecordsCopyWith<$Res> {
  factory $ErrorRecordsCopyWith(
          ErrorRecords value, $Res Function(ErrorRecords) then) =
      _$ErrorRecordsCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorRecordsCopyWithImpl<$Res> extends _$RecordsResultCopyWithImpl<$Res>
    implements $ErrorRecordsCopyWith<$Res> {
  _$ErrorRecordsCopyWithImpl(
      ErrorRecords _value, $Res Function(ErrorRecords) _then)
      : super(_value, (v) => _then(v as ErrorRecords));

  @override
  ErrorRecords get _value => super._value as ErrorRecords;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorRecords(
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

class _$ErrorRecords implements ErrorRecords {
  const _$ErrorRecords(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'RecordsResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorRecords &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorRecordsCopyWith<ErrorRecords> get copyWith =>
      _$ErrorRecordsCopyWithImpl<ErrorRecords>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Record> records) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Record> records)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Record> records)? success,
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
    required TResult Function(SuccessRecords value) success,
    required TResult Function(ErrorRecords value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRecords value)? success,
    TResult Function(ErrorRecords value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRecords value)? success,
    TResult Function(ErrorRecords value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorRecords implements RecordsResult {
  const factory ErrorRecords(int code, String msg) = _$ErrorRecords;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorRecordsCopyWith<ErrorRecords> get copyWith =>
      throw _privateConstructorUsedError;
}
