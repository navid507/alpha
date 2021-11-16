// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'top_swimmers_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TopSwimmersResultTearOff {
  const _$TopSwimmersResultTearOff();

  SuccessTopSwimmers success(TopSwimmers topSwimmers) {
    return SuccessTopSwimmers(
      topSwimmers,
    );
  }

  ErrorTopSwimmers error(int code, String msg) {
    return ErrorTopSwimmers(
      code,
      msg,
    );
  }
}

/// @nodoc
const $TopSwimmersResult = _$TopSwimmersResultTearOff();

/// @nodoc
mixin _$TopSwimmersResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TopSwimmers topSwimmers) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TopSwimmers topSwimmers)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TopSwimmers topSwimmers)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessTopSwimmers value) success,
    required TResult Function(ErrorTopSwimmers value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessTopSwimmers value)? success,
    TResult Function(ErrorTopSwimmers value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessTopSwimmers value)? success,
    TResult Function(ErrorTopSwimmers value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopSwimmersResultCopyWith<$Res> {
  factory $TopSwimmersResultCopyWith(
          TopSwimmersResult value, $Res Function(TopSwimmersResult) then) =
      _$TopSwimmersResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$TopSwimmersResultCopyWithImpl<$Res>
    implements $TopSwimmersResultCopyWith<$Res> {
  _$TopSwimmersResultCopyWithImpl(this._value, this._then);

  final TopSwimmersResult _value;
  // ignore: unused_field
  final $Res Function(TopSwimmersResult) _then;
}

/// @nodoc
abstract class $SuccessTopSwimmersCopyWith<$Res> {
  factory $SuccessTopSwimmersCopyWith(
          SuccessTopSwimmers value, $Res Function(SuccessTopSwimmers) then) =
      _$SuccessTopSwimmersCopyWithImpl<$Res>;
  $Res call({TopSwimmers topSwimmers});
}

/// @nodoc
class _$SuccessTopSwimmersCopyWithImpl<$Res>
    extends _$TopSwimmersResultCopyWithImpl<$Res>
    implements $SuccessTopSwimmersCopyWith<$Res> {
  _$SuccessTopSwimmersCopyWithImpl(
      SuccessTopSwimmers _value, $Res Function(SuccessTopSwimmers) _then)
      : super(_value, (v) => _then(v as SuccessTopSwimmers));

  @override
  SuccessTopSwimmers get _value => super._value as SuccessTopSwimmers;

  @override
  $Res call({
    Object? topSwimmers = freezed,
  }) {
    return _then(SuccessTopSwimmers(
      topSwimmers == freezed
          ? _value.topSwimmers
          : topSwimmers // ignore: cast_nullable_to_non_nullable
              as TopSwimmers,
    ));
  }
}

/// @nodoc

class _$SuccessTopSwimmers implements SuccessTopSwimmers {
  const _$SuccessTopSwimmers(this.topSwimmers);

  @override
  final TopSwimmers topSwimmers;

  @override
  String toString() {
    return 'TopSwimmersResult.success(topSwimmers: $topSwimmers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessTopSwimmers &&
            (identical(other.topSwimmers, topSwimmers) ||
                other.topSwimmers == topSwimmers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topSwimmers);

  @JsonKey(ignore: true)
  @override
  $SuccessTopSwimmersCopyWith<SuccessTopSwimmers> get copyWith =>
      _$SuccessTopSwimmersCopyWithImpl<SuccessTopSwimmers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TopSwimmers topSwimmers) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(topSwimmers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TopSwimmers topSwimmers)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(topSwimmers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TopSwimmers topSwimmers)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(topSwimmers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessTopSwimmers value) success,
    required TResult Function(ErrorTopSwimmers value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessTopSwimmers value)? success,
    TResult Function(ErrorTopSwimmers value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessTopSwimmers value)? success,
    TResult Function(ErrorTopSwimmers value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessTopSwimmers implements TopSwimmersResult {
  const factory SuccessTopSwimmers(TopSwimmers topSwimmers) =
      _$SuccessTopSwimmers;

  TopSwimmers get topSwimmers;
  @JsonKey(ignore: true)
  $SuccessTopSwimmersCopyWith<SuccessTopSwimmers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorTopSwimmersCopyWith<$Res> {
  factory $ErrorTopSwimmersCopyWith(
          ErrorTopSwimmers value, $Res Function(ErrorTopSwimmers) then) =
      _$ErrorTopSwimmersCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorTopSwimmersCopyWithImpl<$Res>
    extends _$TopSwimmersResultCopyWithImpl<$Res>
    implements $ErrorTopSwimmersCopyWith<$Res> {
  _$ErrorTopSwimmersCopyWithImpl(
      ErrorTopSwimmers _value, $Res Function(ErrorTopSwimmers) _then)
      : super(_value, (v) => _then(v as ErrorTopSwimmers));

  @override
  ErrorTopSwimmers get _value => super._value as ErrorTopSwimmers;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorTopSwimmers(
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

class _$ErrorTopSwimmers implements ErrorTopSwimmers {
  const _$ErrorTopSwimmers(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'TopSwimmersResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorTopSwimmers &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorTopSwimmersCopyWith<ErrorTopSwimmers> get copyWith =>
      _$ErrorTopSwimmersCopyWithImpl<ErrorTopSwimmers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TopSwimmers topSwimmers) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TopSwimmers topSwimmers)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TopSwimmers topSwimmers)? success,
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
    required TResult Function(SuccessTopSwimmers value) success,
    required TResult Function(ErrorTopSwimmers value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessTopSwimmers value)? success,
    TResult Function(ErrorTopSwimmers value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessTopSwimmers value)? success,
    TResult Function(ErrorTopSwimmers value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorTopSwimmers implements TopSwimmersResult {
  const factory ErrorTopSwimmers(int code, String msg) = _$ErrorTopSwimmers;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorTopSwimmersCopyWith<ErrorTopSwimmers> get copyWith =>
      throw _privateConstructorUsedError;
}
