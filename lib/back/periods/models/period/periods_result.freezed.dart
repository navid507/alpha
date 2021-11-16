// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'periods_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PeriodsResultTearOff {
  const _$PeriodsResultTearOff();

  SuccessPeriods success(List<Period> periods) {
    return SuccessPeriods(
      periods,
    );
  }

  ErrorPeriods error(int code, String msg) {
    return ErrorPeriods(
      code,
      msg,
    );
  }
}

/// @nodoc
const $PeriodsResult = _$PeriodsResultTearOff();

/// @nodoc
mixin _$PeriodsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Period> periods) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Period> periods)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Period> periods)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessPeriods value) success,
    required TResult Function(ErrorPeriods value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPeriods value)? success,
    TResult Function(ErrorPeriods value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPeriods value)? success,
    TResult Function(ErrorPeriods value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodsResultCopyWith<$Res> {
  factory $PeriodsResultCopyWith(
          PeriodsResult value, $Res Function(PeriodsResult) then) =
      _$PeriodsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$PeriodsResultCopyWithImpl<$Res>
    implements $PeriodsResultCopyWith<$Res> {
  _$PeriodsResultCopyWithImpl(this._value, this._then);

  final PeriodsResult _value;
  // ignore: unused_field
  final $Res Function(PeriodsResult) _then;
}

/// @nodoc
abstract class $SuccessPeriodsCopyWith<$Res> {
  factory $SuccessPeriodsCopyWith(
          SuccessPeriods value, $Res Function(SuccessPeriods) then) =
      _$SuccessPeriodsCopyWithImpl<$Res>;
  $Res call({List<Period> periods});
}

/// @nodoc
class _$SuccessPeriodsCopyWithImpl<$Res>
    extends _$PeriodsResultCopyWithImpl<$Res>
    implements $SuccessPeriodsCopyWith<$Res> {
  _$SuccessPeriodsCopyWithImpl(
      SuccessPeriods _value, $Res Function(SuccessPeriods) _then)
      : super(_value, (v) => _then(v as SuccessPeriods));

  @override
  SuccessPeriods get _value => super._value as SuccessPeriods;

  @override
  $Res call({
    Object? periods = freezed,
  }) {
    return _then(SuccessPeriods(
      periods == freezed
          ? _value.periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<Period>,
    ));
  }
}

/// @nodoc

class _$SuccessPeriods with DiagnosticableTreeMixin implements SuccessPeriods {
  const _$SuccessPeriods(this.periods);

  @override
  final List<Period> periods;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeriodsResult.success(periods: $periods)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeriodsResult.success'))
      ..add(DiagnosticsProperty('periods', periods));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessPeriods &&
            const DeepCollectionEquality().equals(other.periods, periods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(periods));

  @JsonKey(ignore: true)
  @override
  $SuccessPeriodsCopyWith<SuccessPeriods> get copyWith =>
      _$SuccessPeriodsCopyWithImpl<SuccessPeriods>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Period> periods) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(periods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Period> periods)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(periods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Period> periods)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(periods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessPeriods value) success,
    required TResult Function(ErrorPeriods value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPeriods value)? success,
    TResult Function(ErrorPeriods value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPeriods value)? success,
    TResult Function(ErrorPeriods value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessPeriods implements PeriodsResult {
  const factory SuccessPeriods(List<Period> periods) = _$SuccessPeriods;

  List<Period> get periods;
  @JsonKey(ignore: true)
  $SuccessPeriodsCopyWith<SuccessPeriods> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorPeriodsCopyWith<$Res> {
  factory $ErrorPeriodsCopyWith(
          ErrorPeriods value, $Res Function(ErrorPeriods) then) =
      _$ErrorPeriodsCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorPeriodsCopyWithImpl<$Res> extends _$PeriodsResultCopyWithImpl<$Res>
    implements $ErrorPeriodsCopyWith<$Res> {
  _$ErrorPeriodsCopyWithImpl(
      ErrorPeriods _value, $Res Function(ErrorPeriods) _then)
      : super(_value, (v) => _then(v as ErrorPeriods));

  @override
  ErrorPeriods get _value => super._value as ErrorPeriods;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorPeriods(
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

class _$ErrorPeriods with DiagnosticableTreeMixin implements ErrorPeriods {
  const _$ErrorPeriods(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeriodsResult.error(code: $code, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeriodsResult.error'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorPeriods &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorPeriodsCopyWith<ErrorPeriods> get copyWith =>
      _$ErrorPeriodsCopyWithImpl<ErrorPeriods>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Period> periods) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Period> periods)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Period> periods)? success,
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
    required TResult Function(SuccessPeriods value) success,
    required TResult Function(ErrorPeriods value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPeriods value)? success,
    TResult Function(ErrorPeriods value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPeriods value)? success,
    TResult Function(ErrorPeriods value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorPeriods implements PeriodsResult {
  const factory ErrorPeriods(int code, String msg) = _$ErrorPeriods;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorPeriodsCopyWith<ErrorPeriods> get copyWith =>
      throw _privateConstructorUsedError;
}
