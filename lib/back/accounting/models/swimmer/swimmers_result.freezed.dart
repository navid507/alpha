// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'swimmers_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SwimmersResultTearOff {
  const _$SwimmersResultTearOff();

  SuccessSwimmers success(List<Swimmer> swimmers) {
    return SuccessSwimmers(
      swimmers,
    );
  }

  ErrorSwimmers error(int code, String msg) {
    return ErrorSwimmers(
      code,
      msg,
    );
  }
}

/// @nodoc
const $SwimmersResult = _$SwimmersResultTearOff();

/// @nodoc
mixin _$SwimmersResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Swimmer> swimmers) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Swimmer> swimmers)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Swimmer> swimmers)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessSwimmers value) success,
    required TResult Function(ErrorSwimmers value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSwimmers value)? success,
    TResult Function(ErrorSwimmers value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSwimmers value)? success,
    TResult Function(ErrorSwimmers value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwimmersResultCopyWith<$Res> {
  factory $SwimmersResultCopyWith(
          SwimmersResult value, $Res Function(SwimmersResult) then) =
      _$SwimmersResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$SwimmersResultCopyWithImpl<$Res>
    implements $SwimmersResultCopyWith<$Res> {
  _$SwimmersResultCopyWithImpl(this._value, this._then);

  final SwimmersResult _value;
  // ignore: unused_field
  final $Res Function(SwimmersResult) _then;
}

/// @nodoc
abstract class $SuccessSwimmersCopyWith<$Res> {
  factory $SuccessSwimmersCopyWith(
          SuccessSwimmers value, $Res Function(SuccessSwimmers) then) =
      _$SuccessSwimmersCopyWithImpl<$Res>;
  $Res call({List<Swimmer> swimmers});
}

/// @nodoc
class _$SuccessSwimmersCopyWithImpl<$Res>
    extends _$SwimmersResultCopyWithImpl<$Res>
    implements $SuccessSwimmersCopyWith<$Res> {
  _$SuccessSwimmersCopyWithImpl(
      SuccessSwimmers _value, $Res Function(SuccessSwimmers) _then)
      : super(_value, (v) => _then(v as SuccessSwimmers));

  @override
  SuccessSwimmers get _value => super._value as SuccessSwimmers;

  @override
  $Res call({
    Object? swimmers = freezed,
  }) {
    return _then(SuccessSwimmers(
      swimmers == freezed
          ? _value.swimmers
          : swimmers // ignore: cast_nullable_to_non_nullable
              as List<Swimmer>,
    ));
  }
}

/// @nodoc

class _$SuccessSwimmers implements SuccessSwimmers {
  const _$SuccessSwimmers(this.swimmers);

  @override
  final List<Swimmer> swimmers;

  @override
  String toString() {
    return 'SwimmersResult.success(swimmers: $swimmers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessSwimmers &&
            const DeepCollectionEquality().equals(other.swimmers, swimmers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(swimmers));

  @JsonKey(ignore: true)
  @override
  $SuccessSwimmersCopyWith<SuccessSwimmers> get copyWith =>
      _$SuccessSwimmersCopyWithImpl<SuccessSwimmers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Swimmer> swimmers) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(swimmers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Swimmer> swimmers)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(swimmers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Swimmer> swimmers)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(swimmers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessSwimmers value) success,
    required TResult Function(ErrorSwimmers value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSwimmers value)? success,
    TResult Function(ErrorSwimmers value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSwimmers value)? success,
    TResult Function(ErrorSwimmers value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessSwimmers implements SwimmersResult {
  const factory SuccessSwimmers(List<Swimmer> swimmers) = _$SuccessSwimmers;

  List<Swimmer> get swimmers;
  @JsonKey(ignore: true)
  $SuccessSwimmersCopyWith<SuccessSwimmers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorSwimmersCopyWith<$Res> {
  factory $ErrorSwimmersCopyWith(
          ErrorSwimmers value, $Res Function(ErrorSwimmers) then) =
      _$ErrorSwimmersCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorSwimmersCopyWithImpl<$Res>
    extends _$SwimmersResultCopyWithImpl<$Res>
    implements $ErrorSwimmersCopyWith<$Res> {
  _$ErrorSwimmersCopyWithImpl(
      ErrorSwimmers _value, $Res Function(ErrorSwimmers) _then)
      : super(_value, (v) => _then(v as ErrorSwimmers));

  @override
  ErrorSwimmers get _value => super._value as ErrorSwimmers;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorSwimmers(
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

class _$ErrorSwimmers implements ErrorSwimmers {
  const _$ErrorSwimmers(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'SwimmersResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorSwimmers &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorSwimmersCopyWith<ErrorSwimmers> get copyWith =>
      _$ErrorSwimmersCopyWithImpl<ErrorSwimmers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Swimmer> swimmers) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Swimmer> swimmers)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Swimmer> swimmers)? success,
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
    required TResult Function(SuccessSwimmers value) success,
    required TResult Function(ErrorSwimmers value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessSwimmers value)? success,
    TResult Function(ErrorSwimmers value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessSwimmers value)? success,
    TResult Function(ErrorSwimmers value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorSwimmers implements SwimmersResult {
  const factory ErrorSwimmers(int code, String msg) = _$ErrorSwimmers;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorSwimmersCopyWith<ErrorSwimmers> get copyWith =>
      throw _privateConstructorUsedError;
}
