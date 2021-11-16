// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'period_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PeriodResultTearOff {
  const _$PeriodResultTearOff();

  SuccessPeriod success(Period period) {
    return SuccessPeriod(
      period,
    );
  }

  ErrorPeriod error(int code, String msg) {
    return ErrorPeriod(
      code,
      msg,
    );
  }
}

/// @nodoc
const $PeriodResult = _$PeriodResultTearOff();

/// @nodoc
mixin _$PeriodResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Period period) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Period period)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Period period)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessPeriod value) success,
    required TResult Function(ErrorPeriod value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPeriod value)? success,
    TResult Function(ErrorPeriod value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPeriod value)? success,
    TResult Function(ErrorPeriod value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodResultCopyWith<$Res> {
  factory $PeriodResultCopyWith(
          PeriodResult value, $Res Function(PeriodResult) then) =
      _$PeriodResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$PeriodResultCopyWithImpl<$Res> implements $PeriodResultCopyWith<$Res> {
  _$PeriodResultCopyWithImpl(this._value, this._then);

  final PeriodResult _value;
  // ignore: unused_field
  final $Res Function(PeriodResult) _then;
}

/// @nodoc
abstract class $SuccessPeriodCopyWith<$Res> {
  factory $SuccessPeriodCopyWith(
          SuccessPeriod value, $Res Function(SuccessPeriod) then) =
      _$SuccessPeriodCopyWithImpl<$Res>;
  $Res call({Period period});
}

/// @nodoc
class _$SuccessPeriodCopyWithImpl<$Res> extends _$PeriodResultCopyWithImpl<$Res>
    implements $SuccessPeriodCopyWith<$Res> {
  _$SuccessPeriodCopyWithImpl(
      SuccessPeriod _value, $Res Function(SuccessPeriod) _then)
      : super(_value, (v) => _then(v as SuccessPeriod));

  @override
  SuccessPeriod get _value => super._value as SuccessPeriod;

  @override
  $Res call({
    Object? period = freezed,
  }) {
    return _then(SuccessPeriod(
      period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
    ));
  }
}

/// @nodoc

class _$SuccessPeriod with DiagnosticableTreeMixin implements SuccessPeriod {
  const _$SuccessPeriod(this.period);

  @override
  final Period period;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeriodResult.success(period: $period)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeriodResult.success'))
      ..add(DiagnosticsProperty('period', period));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessPeriod &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period);

  @JsonKey(ignore: true)
  @override
  $SuccessPeriodCopyWith<SuccessPeriod> get copyWith =>
      _$SuccessPeriodCopyWithImpl<SuccessPeriod>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Period period) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Period period)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Period period)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessPeriod value) success,
    required TResult Function(ErrorPeriod value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPeriod value)? success,
    TResult Function(ErrorPeriod value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPeriod value)? success,
    TResult Function(ErrorPeriod value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessPeriod implements PeriodResult {
  const factory SuccessPeriod(Period period) = _$SuccessPeriod;

  Period get period;
  @JsonKey(ignore: true)
  $SuccessPeriodCopyWith<SuccessPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorPeriodCopyWith<$Res> {
  factory $ErrorPeriodCopyWith(
          ErrorPeriod value, $Res Function(ErrorPeriod) then) =
      _$ErrorPeriodCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorPeriodCopyWithImpl<$Res> extends _$PeriodResultCopyWithImpl<$Res>
    implements $ErrorPeriodCopyWith<$Res> {
  _$ErrorPeriodCopyWithImpl(
      ErrorPeriod _value, $Res Function(ErrorPeriod) _then)
      : super(_value, (v) => _then(v as ErrorPeriod));

  @override
  ErrorPeriod get _value => super._value as ErrorPeriod;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorPeriod(
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

class _$ErrorPeriod with DiagnosticableTreeMixin implements ErrorPeriod {
  const _$ErrorPeriod(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeriodResult.error(code: $code, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeriodResult.error'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorPeriod &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorPeriodCopyWith<ErrorPeriod> get copyWith =>
      _$ErrorPeriodCopyWithImpl<ErrorPeriod>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Period period) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Period period)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Period period)? success,
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
    required TResult Function(SuccessPeriod value) success,
    required TResult Function(ErrorPeriod value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPeriod value)? success,
    TResult Function(ErrorPeriod value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPeriod value)? success,
    TResult Function(ErrorPeriod value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorPeriod implements PeriodResult {
  const factory ErrorPeriod(int code, String msg) = _$ErrorPeriod;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorPeriodCopyWith<ErrorPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}
