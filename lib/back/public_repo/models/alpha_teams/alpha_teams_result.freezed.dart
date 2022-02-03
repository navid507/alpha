// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alpha_teams_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlphaTeamsResultTearOff {
  const _$AlphaTeamsResultTearOff();

  SuccessAlphaTeams success(AlphaTeams alphaTeam) {
    return SuccessAlphaTeams(
      alphaTeam,
    );
  }

  ErrorAlphaTeams error(int code, String msg) {
    return ErrorAlphaTeams(
      code,
      msg,
    );
  }
}

/// @nodoc
const $AlphaTeamsResult = _$AlphaTeamsResultTearOff();

/// @nodoc
mixin _$AlphaTeamsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AlphaTeams alphaTeam) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AlphaTeams alphaTeam)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AlphaTeams alphaTeam)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessAlphaTeams value) success,
    required TResult Function(ErrorAlphaTeams value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessAlphaTeams value)? success,
    TResult Function(ErrorAlphaTeams value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessAlphaTeams value)? success,
    TResult Function(ErrorAlphaTeams value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlphaTeamsResultCopyWith<$Res> {
  factory $AlphaTeamsResultCopyWith(
          AlphaTeamsResult value, $Res Function(AlphaTeamsResult) then) =
      _$AlphaTeamsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlphaTeamsResultCopyWithImpl<$Res>
    implements $AlphaTeamsResultCopyWith<$Res> {
  _$AlphaTeamsResultCopyWithImpl(this._value, this._then);

  final AlphaTeamsResult _value;
  // ignore: unused_field
  final $Res Function(AlphaTeamsResult) _then;
}

/// @nodoc
abstract class $SuccessAlphaTeamsCopyWith<$Res> {
  factory $SuccessAlphaTeamsCopyWith(
          SuccessAlphaTeams value, $Res Function(SuccessAlphaTeams) then) =
      _$SuccessAlphaTeamsCopyWithImpl<$Res>;
  $Res call({AlphaTeams alphaTeam});
}

/// @nodoc
class _$SuccessAlphaTeamsCopyWithImpl<$Res>
    extends _$AlphaTeamsResultCopyWithImpl<$Res>
    implements $SuccessAlphaTeamsCopyWith<$Res> {
  _$SuccessAlphaTeamsCopyWithImpl(
      SuccessAlphaTeams _value, $Res Function(SuccessAlphaTeams) _then)
      : super(_value, (v) => _then(v as SuccessAlphaTeams));

  @override
  SuccessAlphaTeams get _value => super._value as SuccessAlphaTeams;

  @override
  $Res call({
    Object? alphaTeam = freezed,
  }) {
    return _then(SuccessAlphaTeams(
      alphaTeam == freezed
          ? _value.alphaTeam
          : alphaTeam // ignore: cast_nullable_to_non_nullable
              as AlphaTeams,
    ));
  }
}

/// @nodoc

class _$SuccessAlphaTeams implements SuccessAlphaTeams {
  const _$SuccessAlphaTeams(this.alphaTeam);

  @override
  final AlphaTeams alphaTeam;

  @override
  String toString() {
    return 'AlphaTeamsResult.success(alphaTeam: $alphaTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessAlphaTeams &&
            (identical(other.alphaTeam, alphaTeam) ||
                other.alphaTeam == alphaTeam));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alphaTeam);

  @JsonKey(ignore: true)
  @override
  $SuccessAlphaTeamsCopyWith<SuccessAlphaTeams> get copyWith =>
      _$SuccessAlphaTeamsCopyWithImpl<SuccessAlphaTeams>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AlphaTeams alphaTeam) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(alphaTeam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AlphaTeams alphaTeam)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(alphaTeam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AlphaTeams alphaTeam)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(alphaTeam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessAlphaTeams value) success,
    required TResult Function(ErrorAlphaTeams value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessAlphaTeams value)? success,
    TResult Function(ErrorAlphaTeams value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessAlphaTeams value)? success,
    TResult Function(ErrorAlphaTeams value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessAlphaTeams implements AlphaTeamsResult {
  const factory SuccessAlphaTeams(AlphaTeams alphaTeam) = _$SuccessAlphaTeams;

  AlphaTeams get alphaTeam;
  @JsonKey(ignore: true)
  $SuccessAlphaTeamsCopyWith<SuccessAlphaTeams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorAlphaTeamsCopyWith<$Res> {
  factory $ErrorAlphaTeamsCopyWith(
          ErrorAlphaTeams value, $Res Function(ErrorAlphaTeams) then) =
      _$ErrorAlphaTeamsCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorAlphaTeamsCopyWithImpl<$Res>
    extends _$AlphaTeamsResultCopyWithImpl<$Res>
    implements $ErrorAlphaTeamsCopyWith<$Res> {
  _$ErrorAlphaTeamsCopyWithImpl(
      ErrorAlphaTeams _value, $Res Function(ErrorAlphaTeams) _then)
      : super(_value, (v) => _then(v as ErrorAlphaTeams));

  @override
  ErrorAlphaTeams get _value => super._value as ErrorAlphaTeams;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorAlphaTeams(
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

class _$ErrorAlphaTeams implements ErrorAlphaTeams {
  const _$ErrorAlphaTeams(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'AlphaTeamsResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorAlphaTeams &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorAlphaTeamsCopyWith<ErrorAlphaTeams> get copyWith =>
      _$ErrorAlphaTeamsCopyWithImpl<ErrorAlphaTeams>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AlphaTeams alphaTeam) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AlphaTeams alphaTeam)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AlphaTeams alphaTeam)? success,
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
    required TResult Function(SuccessAlphaTeams value) success,
    required TResult Function(ErrorAlphaTeams value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessAlphaTeams value)? success,
    TResult Function(ErrorAlphaTeams value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessAlphaTeams value)? success,
    TResult Function(ErrorAlphaTeams value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAlphaTeams implements AlphaTeamsResult {
  const factory ErrorAlphaTeams(int code, String msg) = _$ErrorAlphaTeams;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorAlphaTeamsCopyWith<ErrorAlphaTeams> get copyWith =>
      throw _privateConstructorUsedError;
}
