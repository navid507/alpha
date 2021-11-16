// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alpha_club_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlphaClubResultTearOff {
  const _$AlphaClubResultTearOff();

  SuccessAlphaClub success(AlphaClub alphaClub) {
    return SuccessAlphaClub(
      alphaClub,
    );
  }

  ErrorAlphaClub error(int code, String msg) {
    return ErrorAlphaClub(
      code,
      msg,
    );
  }
}

/// @nodoc
const $AlphaClubResult = _$AlphaClubResultTearOff();

/// @nodoc
mixin _$AlphaClubResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AlphaClub alphaClub) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AlphaClub alphaClub)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AlphaClub alphaClub)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessAlphaClub value) success,
    required TResult Function(ErrorAlphaClub value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessAlphaClub value)? success,
    TResult Function(ErrorAlphaClub value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessAlphaClub value)? success,
    TResult Function(ErrorAlphaClub value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlphaClubResultCopyWith<$Res> {
  factory $AlphaClubResultCopyWith(
          AlphaClubResult value, $Res Function(AlphaClubResult) then) =
      _$AlphaClubResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlphaClubResultCopyWithImpl<$Res>
    implements $AlphaClubResultCopyWith<$Res> {
  _$AlphaClubResultCopyWithImpl(this._value, this._then);

  final AlphaClubResult _value;
  // ignore: unused_field
  final $Res Function(AlphaClubResult) _then;
}

/// @nodoc
abstract class $SuccessAlphaClubCopyWith<$Res> {
  factory $SuccessAlphaClubCopyWith(
          SuccessAlphaClub value, $Res Function(SuccessAlphaClub) then) =
      _$SuccessAlphaClubCopyWithImpl<$Res>;
  $Res call({AlphaClub alphaClub});
}

/// @nodoc
class _$SuccessAlphaClubCopyWithImpl<$Res>
    extends _$AlphaClubResultCopyWithImpl<$Res>
    implements $SuccessAlphaClubCopyWith<$Res> {
  _$SuccessAlphaClubCopyWithImpl(
      SuccessAlphaClub _value, $Res Function(SuccessAlphaClub) _then)
      : super(_value, (v) => _then(v as SuccessAlphaClub));

  @override
  SuccessAlphaClub get _value => super._value as SuccessAlphaClub;

  @override
  $Res call({
    Object? alphaClub = freezed,
  }) {
    return _then(SuccessAlphaClub(
      alphaClub == freezed
          ? _value.alphaClub
          : alphaClub // ignore: cast_nullable_to_non_nullable
              as AlphaClub,
    ));
  }
}

/// @nodoc

class _$SuccessAlphaClub implements SuccessAlphaClub {
  const _$SuccessAlphaClub(this.alphaClub);

  @override
  final AlphaClub alphaClub;

  @override
  String toString() {
    return 'AlphaClubResult.success(alphaClub: $alphaClub)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessAlphaClub &&
            (identical(other.alphaClub, alphaClub) ||
                other.alphaClub == alphaClub));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alphaClub);

  @JsonKey(ignore: true)
  @override
  $SuccessAlphaClubCopyWith<SuccessAlphaClub> get copyWith =>
      _$SuccessAlphaClubCopyWithImpl<SuccessAlphaClub>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AlphaClub alphaClub) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(alphaClub);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AlphaClub alphaClub)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(alphaClub);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AlphaClub alphaClub)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(alphaClub);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessAlphaClub value) success,
    required TResult Function(ErrorAlphaClub value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessAlphaClub value)? success,
    TResult Function(ErrorAlphaClub value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessAlphaClub value)? success,
    TResult Function(ErrorAlphaClub value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessAlphaClub implements AlphaClubResult {
  const factory SuccessAlphaClub(AlphaClub alphaClub) = _$SuccessAlphaClub;

  AlphaClub get alphaClub;
  @JsonKey(ignore: true)
  $SuccessAlphaClubCopyWith<SuccessAlphaClub> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorAlphaClubCopyWith<$Res> {
  factory $ErrorAlphaClubCopyWith(
          ErrorAlphaClub value, $Res Function(ErrorAlphaClub) then) =
      _$ErrorAlphaClubCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorAlphaClubCopyWithImpl<$Res>
    extends _$AlphaClubResultCopyWithImpl<$Res>
    implements $ErrorAlphaClubCopyWith<$Res> {
  _$ErrorAlphaClubCopyWithImpl(
      ErrorAlphaClub _value, $Res Function(ErrorAlphaClub) _then)
      : super(_value, (v) => _then(v as ErrorAlphaClub));

  @override
  ErrorAlphaClub get _value => super._value as ErrorAlphaClub;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorAlphaClub(
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

class _$ErrorAlphaClub implements ErrorAlphaClub {
  const _$ErrorAlphaClub(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'AlphaClubResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorAlphaClub &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorAlphaClubCopyWith<ErrorAlphaClub> get copyWith =>
      _$ErrorAlphaClubCopyWithImpl<ErrorAlphaClub>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AlphaClub alphaClub) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AlphaClub alphaClub)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AlphaClub alphaClub)? success,
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
    required TResult Function(SuccessAlphaClub value) success,
    required TResult Function(ErrorAlphaClub value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessAlphaClub value)? success,
    TResult Function(ErrorAlphaClub value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessAlphaClub value)? success,
    TResult Function(ErrorAlphaClub value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAlphaClub implements AlphaClubResult {
  const factory ErrorAlphaClub(int code, String msg) = _$ErrorAlphaClub;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorAlphaClubCopyWith<ErrorAlphaClub> get copyWith =>
      throw _privateConstructorUsedError;
}
