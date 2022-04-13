// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'public_profile_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PublicProfileResultTearOff {
  const _$PublicProfileResultTearOff();

  SuccessPublicProfile success(PublicProfile publicProfile) {
    return SuccessPublicProfile(
      publicProfile,
    );
  }

  ErrorPublicProfile error(int code, String msg) {
    return ErrorPublicProfile(
      code,
      msg,
    );
  }
}

/// @nodoc
const $PublicProfileResult = _$PublicProfileResultTearOff();

/// @nodoc
mixin _$PublicProfileResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PublicProfile publicProfile) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PublicProfile publicProfile)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PublicProfile publicProfile)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessPublicProfile value) success,
    required TResult Function(ErrorPublicProfile value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPublicProfile value)? success,
    TResult Function(ErrorPublicProfile value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPublicProfile value)? success,
    TResult Function(ErrorPublicProfile value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicProfileResultCopyWith<$Res> {
  factory $PublicProfileResultCopyWith(
          PublicProfileResult value, $Res Function(PublicProfileResult) then) =
      _$PublicProfileResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$PublicProfileResultCopyWithImpl<$Res>
    implements $PublicProfileResultCopyWith<$Res> {
  _$PublicProfileResultCopyWithImpl(this._value, this._then);

  final PublicProfileResult _value;
  // ignore: unused_field
  final $Res Function(PublicProfileResult) _then;
}

/// @nodoc
abstract class $SuccessPublicProfileCopyWith<$Res> {
  factory $SuccessPublicProfileCopyWith(SuccessPublicProfile value,
          $Res Function(SuccessPublicProfile) then) =
      _$SuccessPublicProfileCopyWithImpl<$Res>;
  $Res call({PublicProfile publicProfile});
}

/// @nodoc
class _$SuccessPublicProfileCopyWithImpl<$Res>
    extends _$PublicProfileResultCopyWithImpl<$Res>
    implements $SuccessPublicProfileCopyWith<$Res> {
  _$SuccessPublicProfileCopyWithImpl(
      SuccessPublicProfile _value, $Res Function(SuccessPublicProfile) _then)
      : super(_value, (v) => _then(v as SuccessPublicProfile));

  @override
  SuccessPublicProfile get _value => super._value as SuccessPublicProfile;

  @override
  $Res call({
    Object? publicProfile = freezed,
  }) {
    return _then(SuccessPublicProfile(
      publicProfile == freezed
          ? _value.publicProfile
          : publicProfile // ignore: cast_nullable_to_non_nullable
              as PublicProfile,
    ));
  }
}

/// @nodoc

class _$SuccessPublicProfile implements SuccessPublicProfile {
  const _$SuccessPublicProfile(this.publicProfile);

  @override
  final PublicProfile publicProfile;

  @override
  String toString() {
    return 'PublicProfileResult.success(publicProfile: $publicProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessPublicProfile &&
            (identical(other.publicProfile, publicProfile) ||
                other.publicProfile == publicProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, publicProfile);

  @JsonKey(ignore: true)
  @override
  $SuccessPublicProfileCopyWith<SuccessPublicProfile> get copyWith =>
      _$SuccessPublicProfileCopyWithImpl<SuccessPublicProfile>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PublicProfile publicProfile) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(publicProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PublicProfile publicProfile)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(publicProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PublicProfile publicProfile)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(publicProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessPublicProfile value) success,
    required TResult Function(ErrorPublicProfile value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPublicProfile value)? success,
    TResult Function(ErrorPublicProfile value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPublicProfile value)? success,
    TResult Function(ErrorPublicProfile value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessPublicProfile implements PublicProfileResult {
  const factory SuccessPublicProfile(PublicProfile publicProfile) =
      _$SuccessPublicProfile;

  PublicProfile get publicProfile;
  @JsonKey(ignore: true)
  $SuccessPublicProfileCopyWith<SuccessPublicProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorPublicProfileCopyWith<$Res> {
  factory $ErrorPublicProfileCopyWith(
          ErrorPublicProfile value, $Res Function(ErrorPublicProfile) then) =
      _$ErrorPublicProfileCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorPublicProfileCopyWithImpl<$Res>
    extends _$PublicProfileResultCopyWithImpl<$Res>
    implements $ErrorPublicProfileCopyWith<$Res> {
  _$ErrorPublicProfileCopyWithImpl(
      ErrorPublicProfile _value, $Res Function(ErrorPublicProfile) _then)
      : super(_value, (v) => _then(v as ErrorPublicProfile));

  @override
  ErrorPublicProfile get _value => super._value as ErrorPublicProfile;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorPublicProfile(
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

class _$ErrorPublicProfile implements ErrorPublicProfile {
  const _$ErrorPublicProfile(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'PublicProfileResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorPublicProfile &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorPublicProfileCopyWith<ErrorPublicProfile> get copyWith =>
      _$ErrorPublicProfileCopyWithImpl<ErrorPublicProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PublicProfile publicProfile) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PublicProfile publicProfile)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PublicProfile publicProfile)? success,
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
    required TResult Function(SuccessPublicProfile value) success,
    required TResult Function(ErrorPublicProfile value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessPublicProfile value)? success,
    TResult Function(ErrorPublicProfile value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessPublicProfile value)? success,
    TResult Function(ErrorPublicProfile value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorPublicProfile implements PublicProfileResult {
  const factory ErrorPublicProfile(int code, String msg) = _$ErrorPublicProfile;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorPublicProfileCopyWith<ErrorPublicProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
