// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sessions_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SessionsResultTearOff {
  const _$SessionsResultTearOff();

  SuccessSessions success(List<Session> sessions) {
    return SuccessSessions(
      sessions,
    );
  }

  ErrorSessions error(int code, String msg) {
    return ErrorSessions(
      code,
      msg,
    );
  }
}

/// @nodoc
const $SessionsResult = _$SessionsResultTearOff();

/// @nodoc
mixin _$SessionsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Session> sessions) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Session> sessions)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Session> sessions)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessSessions value) success,
    required TResult Function(ErrorSessions value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSessions value)? success,
    TResult Function(ErrorSessions value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSessions value)? success,
    TResult Function(ErrorSessions value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsResultCopyWith<$Res> {
  factory $SessionsResultCopyWith(
          SessionsResult value, $Res Function(SessionsResult) then) =
      _$SessionsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$SessionsResultCopyWithImpl<$Res>
    implements $SessionsResultCopyWith<$Res> {
  _$SessionsResultCopyWithImpl(this._value, this._then);

  final SessionsResult _value;
  // ignore: unused_field
  final $Res Function(SessionsResult) _then;
}

/// @nodoc
abstract class $SuccessSessionsCopyWith<$Res> {
  factory $SuccessSessionsCopyWith(
          SuccessSessions value, $Res Function(SuccessSessions) then) =
      _$SuccessSessionsCopyWithImpl<$Res>;
  $Res call({List<Session> sessions});
}

/// @nodoc
class _$SuccessSessionsCopyWithImpl<$Res>
    extends _$SessionsResultCopyWithImpl<$Res>
    implements $SuccessSessionsCopyWith<$Res> {
  _$SuccessSessionsCopyWithImpl(
      SuccessSessions _value, $Res Function(SuccessSessions) _then)
      : super(_value, (v) => _then(v as SuccessSessions));

  @override
  SuccessSessions get _value => super._value as SuccessSessions;

  @override
  $Res call({
    Object? sessions = freezed,
  }) {
    return _then(SuccessSessions(
      sessions == freezed
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class _$SuccessSessions
    with DiagnosticableTreeMixin
    implements SuccessSessions {
  const _$SuccessSessions(this.sessions);

  @override
  final List<Session> sessions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsResult.success(sessions: $sessions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsResult.success'))
      ..add(DiagnosticsProperty('sessions', sessions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessSessions &&
            const DeepCollectionEquality().equals(other.sessions, sessions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sessions));

  @JsonKey(ignore: true)
  @override
  $SuccessSessionsCopyWith<SuccessSessions> get copyWith =>
      _$SuccessSessionsCopyWithImpl<SuccessSessions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Session> sessions) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(sessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Session> sessions)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(sessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Session> sessions)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(sessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessSessions value) success,
    required TResult Function(ErrorSessions value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSessions value)? success,
    TResult Function(ErrorSessions value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSessions value)? success,
    TResult Function(ErrorSessions value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessSessions implements SessionsResult {
  const factory SuccessSessions(List<Session> sessions) = _$SuccessSessions;

  List<Session> get sessions;
  @JsonKey(ignore: true)
  $SuccessSessionsCopyWith<SuccessSessions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorSessionsCopyWith<$Res> {
  factory $ErrorSessionsCopyWith(
          ErrorSessions value, $Res Function(ErrorSessions) then) =
      _$ErrorSessionsCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorSessionsCopyWithImpl<$Res>
    extends _$SessionsResultCopyWithImpl<$Res>
    implements $ErrorSessionsCopyWith<$Res> {
  _$ErrorSessionsCopyWithImpl(
      ErrorSessions _value, $Res Function(ErrorSessions) _then)
      : super(_value, (v) => _then(v as ErrorSessions));

  @override
  ErrorSessions get _value => super._value as ErrorSessions;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorSessions(
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

class _$ErrorSessions with DiagnosticableTreeMixin implements ErrorSessions {
  const _$ErrorSessions(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsResult.error(code: $code, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsResult.error'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorSessions &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorSessionsCopyWith<ErrorSessions> get copyWith =>
      _$ErrorSessionsCopyWithImpl<ErrorSessions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Session> sessions) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Session> sessions)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Session> sessions)? success,
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
    required TResult Function(SuccessSessions value) success,
    required TResult Function(ErrorSessions value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSessions value)? success,
    TResult Function(ErrorSessions value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSessions value)? success,
    TResult Function(ErrorSessions value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorSessions implements SessionsResult {
  const factory ErrorSessions(int code, String msg) = _$ErrorSessions;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorSessionsCopyWith<ErrorSessions> get copyWith =>
      throw _privateConstructorUsedError;
}
