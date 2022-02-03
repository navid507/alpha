// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'swimmer_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SwimmerResultTearOff {
  const _$SwimmerResultTearOff();

  SuccessSwimmer success(Swimmer swimmer) {
    return SuccessSwimmer(
      swimmer,
    );
  }

  ErrorSwimmer error(int code, String msg) {
    return ErrorSwimmer(
      code,
      msg,
    );
  }
}

/// @nodoc
const $SwimmerResult = _$SwimmerResultTearOff();

/// @nodoc
mixin _$SwimmerResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Swimmer swimmer) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Swimmer swimmer)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Swimmer swimmer)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessSwimmer value) success,
    required TResult Function(ErrorSwimmer value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSwimmer value)? success,
    TResult Function(ErrorSwimmer value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSwimmer value)? success,
    TResult Function(ErrorSwimmer value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwimmerResultCopyWith<$Res> {
  factory $SwimmerResultCopyWith(
          SwimmerResult value, $Res Function(SwimmerResult) then) =
      _$SwimmerResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$SwimmerResultCopyWithImpl<$Res>
    implements $SwimmerResultCopyWith<$Res> {
  _$SwimmerResultCopyWithImpl(this._value, this._then);

  final SwimmerResult _value;
  // ignore: unused_field
  final $Res Function(SwimmerResult) _then;
}

/// @nodoc
abstract class $SuccessSwimmerCopyWith<$Res> {
  factory $SuccessSwimmerCopyWith(
          SuccessSwimmer value, $Res Function(SuccessSwimmer) then) =
      _$SuccessSwimmerCopyWithImpl<$Res>;
  $Res call({Swimmer swimmer});
}

/// @nodoc
class _$SuccessSwimmerCopyWithImpl<$Res>
    extends _$SwimmerResultCopyWithImpl<$Res>
    implements $SuccessSwimmerCopyWith<$Res> {
  _$SuccessSwimmerCopyWithImpl(
      SuccessSwimmer _value, $Res Function(SuccessSwimmer) _then)
      : super(_value, (v) => _then(v as SuccessSwimmer));

  @override
  SuccessSwimmer get _value => super._value as SuccessSwimmer;

  @override
  $Res call({
    Object? swimmer = freezed,
  }) {
    return _then(SuccessSwimmer(
      swimmer == freezed
          ? _value.swimmer
          : swimmer // ignore: cast_nullable_to_non_nullable
              as Swimmer,
    ));
  }
}

/// @nodoc

class _$SuccessSwimmer implements SuccessSwimmer {
  const _$SuccessSwimmer(this.swimmer);

  @override
  final Swimmer swimmer;

  @override
  String toString() {
    return 'SwimmerResult.success(swimmer: $swimmer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessSwimmer &&
            (identical(other.swimmer, swimmer) || other.swimmer == swimmer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swimmer);

  @JsonKey(ignore: true)
  @override
  $SuccessSwimmerCopyWith<SuccessSwimmer> get copyWith =>
      _$SuccessSwimmerCopyWithImpl<SuccessSwimmer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Swimmer swimmer) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(swimmer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Swimmer swimmer)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(swimmer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Swimmer swimmer)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(swimmer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessSwimmer value) success,
    required TResult Function(ErrorSwimmer value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSwimmer value)? success,
    TResult Function(ErrorSwimmer value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSwimmer value)? success,
    TResult Function(ErrorSwimmer value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessSwimmer implements SwimmerResult {
  const factory SuccessSwimmer(Swimmer swimmer) = _$SuccessSwimmer;

  Swimmer get swimmer;
  @JsonKey(ignore: true)
  $SuccessSwimmerCopyWith<SuccessSwimmer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorSwimmerCopyWith<$Res> {
  factory $ErrorSwimmerCopyWith(
          ErrorSwimmer value, $Res Function(ErrorSwimmer) then) =
      _$ErrorSwimmerCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorSwimmerCopyWithImpl<$Res> extends _$SwimmerResultCopyWithImpl<$Res>
    implements $ErrorSwimmerCopyWith<$Res> {
  _$ErrorSwimmerCopyWithImpl(
      ErrorSwimmer _value, $Res Function(ErrorSwimmer) _then)
      : super(_value, (v) => _then(v as ErrorSwimmer));

  @override
  ErrorSwimmer get _value => super._value as ErrorSwimmer;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorSwimmer(
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

class _$ErrorSwimmer implements ErrorSwimmer {
  const _$ErrorSwimmer(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'SwimmerResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorSwimmer &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorSwimmerCopyWith<ErrorSwimmer> get copyWith =>
      _$ErrorSwimmerCopyWithImpl<ErrorSwimmer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Swimmer swimmer) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Swimmer swimmer)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Swimmer swimmer)? success,
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
    required TResult Function(SuccessSwimmer value) success,
    required TResult Function(ErrorSwimmer value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSwimmer value)? success,
    TResult Function(ErrorSwimmer value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSwimmer value)? success,
    TResult Function(ErrorSwimmer value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorSwimmer implements SwimmerResult {
  const factory ErrorSwimmer(int code, String msg) = _$ErrorSwimmer;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorSwimmerCopyWith<ErrorSwimmer> get copyWith =>
      throw _privateConstructorUsedError;
}
