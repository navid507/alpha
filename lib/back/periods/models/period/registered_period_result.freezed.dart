// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registered_period_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisteredPeriodResultTearOff {
  const _$RegisteredPeriodResultTearOff();

  SuccessRegisteredPeriod success(RegisteredPeriod period) {
    return SuccessRegisteredPeriod(
      period,
    );
  }

  ErrorRegisteredPeriod error(int code, String msg) {
    return ErrorRegisteredPeriod(
      code,
      msg,
    );
  }
}

/// @nodoc
const $RegisteredPeriodResult = _$RegisteredPeriodResultTearOff();

/// @nodoc
mixin _$RegisteredPeriodResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisteredPeriod period) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisteredPeriod period)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisteredPeriod period)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRegisteredPeriod value) success,
    required TResult Function(ErrorRegisteredPeriod value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRegisteredPeriod value)? success,
    TResult Function(ErrorRegisteredPeriod value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRegisteredPeriod value)? success,
    TResult Function(ErrorRegisteredPeriod value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteredPeriodResultCopyWith<$Res> {
  factory $RegisteredPeriodResultCopyWith(RegisteredPeriodResult value,
          $Res Function(RegisteredPeriodResult) then) =
      _$RegisteredPeriodResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisteredPeriodResultCopyWithImpl<$Res>
    implements $RegisteredPeriodResultCopyWith<$Res> {
  _$RegisteredPeriodResultCopyWithImpl(this._value, this._then);

  final RegisteredPeriodResult _value;
  // ignore: unused_field
  final $Res Function(RegisteredPeriodResult) _then;
}

/// @nodoc
abstract class $SuccessRegisteredPeriodCopyWith<$Res> {
  factory $SuccessRegisteredPeriodCopyWith(SuccessRegisteredPeriod value,
          $Res Function(SuccessRegisteredPeriod) then) =
      _$SuccessRegisteredPeriodCopyWithImpl<$Res>;
  $Res call({RegisteredPeriod period});
}

/// @nodoc
class _$SuccessRegisteredPeriodCopyWithImpl<$Res>
    extends _$RegisteredPeriodResultCopyWithImpl<$Res>
    implements $SuccessRegisteredPeriodCopyWith<$Res> {
  _$SuccessRegisteredPeriodCopyWithImpl(SuccessRegisteredPeriod _value,
      $Res Function(SuccessRegisteredPeriod) _then)
      : super(_value, (v) => _then(v as SuccessRegisteredPeriod));

  @override
  SuccessRegisteredPeriod get _value => super._value as SuccessRegisteredPeriod;

  @override
  $Res call({
    Object? period = freezed,
  }) {
    return _then(SuccessRegisteredPeriod(
      period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as RegisteredPeriod,
    ));
  }
}

/// @nodoc

class _$SuccessRegisteredPeriod implements SuccessRegisteredPeriod {
  const _$SuccessRegisteredPeriod(this.period);

  @override
  final RegisteredPeriod period;

  @override
  String toString() {
    return 'RegisteredPeriodResult.success(period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessRegisteredPeriod &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period);

  @JsonKey(ignore: true)
  @override
  $SuccessRegisteredPeriodCopyWith<SuccessRegisteredPeriod> get copyWith =>
      _$SuccessRegisteredPeriodCopyWithImpl<SuccessRegisteredPeriod>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisteredPeriod period) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisteredPeriod period)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisteredPeriod period)? success,
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
    required TResult Function(SuccessRegisteredPeriod value) success,
    required TResult Function(ErrorRegisteredPeriod value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRegisteredPeriod value)? success,
    TResult Function(ErrorRegisteredPeriod value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRegisteredPeriod value)? success,
    TResult Function(ErrorRegisteredPeriod value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessRegisteredPeriod implements RegisteredPeriodResult {
  const factory SuccessRegisteredPeriod(RegisteredPeriod period) =
      _$SuccessRegisteredPeriod;

  RegisteredPeriod get period;
  @JsonKey(ignore: true)
  $SuccessRegisteredPeriodCopyWith<SuccessRegisteredPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorRegisteredPeriodCopyWith<$Res> {
  factory $ErrorRegisteredPeriodCopyWith(ErrorRegisteredPeriod value,
          $Res Function(ErrorRegisteredPeriod) then) =
      _$ErrorRegisteredPeriodCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorRegisteredPeriodCopyWithImpl<$Res>
    extends _$RegisteredPeriodResultCopyWithImpl<$Res>
    implements $ErrorRegisteredPeriodCopyWith<$Res> {
  _$ErrorRegisteredPeriodCopyWithImpl(
      ErrorRegisteredPeriod _value, $Res Function(ErrorRegisteredPeriod) _then)
      : super(_value, (v) => _then(v as ErrorRegisteredPeriod));

  @override
  ErrorRegisteredPeriod get _value => super._value as ErrorRegisteredPeriod;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorRegisteredPeriod(
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

class _$ErrorRegisteredPeriod implements ErrorRegisteredPeriod {
  const _$ErrorRegisteredPeriod(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'RegisteredPeriodResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorRegisteredPeriod &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorRegisteredPeriodCopyWith<ErrorRegisteredPeriod> get copyWith =>
      _$ErrorRegisteredPeriodCopyWithImpl<ErrorRegisteredPeriod>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisteredPeriod period) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisteredPeriod period)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisteredPeriod period)? success,
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
    required TResult Function(SuccessRegisteredPeriod value) success,
    required TResult Function(ErrorRegisteredPeriod value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessRegisteredPeriod value)? success,
    TResult Function(ErrorRegisteredPeriod value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRegisteredPeriod value)? success,
    TResult Function(ErrorRegisteredPeriod value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorRegisteredPeriod implements RegisteredPeriodResult {
  const factory ErrorRegisteredPeriod(int code, String msg) =
      _$ErrorRegisteredPeriod;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorRegisteredPeriodCopyWith<ErrorRegisteredPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}
