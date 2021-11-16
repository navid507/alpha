// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GalleryResultTearOff {
  const _$GalleryResultTearOff();

  SuccessGallery success(Gallery gallery) {
    return SuccessGallery(
      gallery,
    );
  }

  ErrorGallery error(int code, String msg) {
    return ErrorGallery(
      code,
      msg,
    );
  }
}

/// @nodoc
const $GalleryResult = _$GalleryResultTearOff();

/// @nodoc
mixin _$GalleryResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Gallery gallery) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Gallery gallery)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Gallery gallery)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessGallery value) success,
    required TResult Function(ErrorGallery value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessGallery value)? success,
    TResult Function(ErrorGallery value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessGallery value)? success,
    TResult Function(ErrorGallery value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryResultCopyWith<$Res> {
  factory $GalleryResultCopyWith(
          GalleryResult value, $Res Function(GalleryResult) then) =
      _$GalleryResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryResultCopyWithImpl<$Res>
    implements $GalleryResultCopyWith<$Res> {
  _$GalleryResultCopyWithImpl(this._value, this._then);

  final GalleryResult _value;
  // ignore: unused_field
  final $Res Function(GalleryResult) _then;
}

/// @nodoc
abstract class $SuccessGalleryCopyWith<$Res> {
  factory $SuccessGalleryCopyWith(
          SuccessGallery value, $Res Function(SuccessGallery) then) =
      _$SuccessGalleryCopyWithImpl<$Res>;
  $Res call({Gallery gallery});
}

/// @nodoc
class _$SuccessGalleryCopyWithImpl<$Res>
    extends _$GalleryResultCopyWithImpl<$Res>
    implements $SuccessGalleryCopyWith<$Res> {
  _$SuccessGalleryCopyWithImpl(
      SuccessGallery _value, $Res Function(SuccessGallery) _then)
      : super(_value, (v) => _then(v as SuccessGallery));

  @override
  SuccessGallery get _value => super._value as SuccessGallery;

  @override
  $Res call({
    Object? gallery = freezed,
  }) {
    return _then(SuccessGallery(
      gallery == freezed
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as Gallery,
    ));
  }
}

/// @nodoc

class _$SuccessGallery implements SuccessGallery {
  const _$SuccessGallery(this.gallery);

  @override
  final Gallery gallery;

  @override
  String toString() {
    return 'GalleryResult.success(gallery: $gallery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessGallery &&
            (identical(other.gallery, gallery) || other.gallery == gallery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gallery);

  @JsonKey(ignore: true)
  @override
  $SuccessGalleryCopyWith<SuccessGallery> get copyWith =>
      _$SuccessGalleryCopyWithImpl<SuccessGallery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Gallery gallery) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(gallery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Gallery gallery)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(gallery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Gallery gallery)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(gallery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessGallery value) success,
    required TResult Function(ErrorGallery value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessGallery value)? success,
    TResult Function(ErrorGallery value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessGallery value)? success,
    TResult Function(ErrorGallery value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessGallery implements GalleryResult {
  const factory SuccessGallery(Gallery gallery) = _$SuccessGallery;

  Gallery get gallery;
  @JsonKey(ignore: true)
  $SuccessGalleryCopyWith<SuccessGallery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorGalleryCopyWith<$Res> {
  factory $ErrorGalleryCopyWith(
          ErrorGallery value, $Res Function(ErrorGallery) then) =
      _$ErrorGalleryCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorGalleryCopyWithImpl<$Res> extends _$GalleryResultCopyWithImpl<$Res>
    implements $ErrorGalleryCopyWith<$Res> {
  _$ErrorGalleryCopyWithImpl(
      ErrorGallery _value, $Res Function(ErrorGallery) _then)
      : super(_value, (v) => _then(v as ErrorGallery));

  @override
  ErrorGallery get _value => super._value as ErrorGallery;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorGallery(
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

class _$ErrorGallery implements ErrorGallery {
  const _$ErrorGallery(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString() {
    return 'GalleryResult.error(code: $code, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorGallery &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorGalleryCopyWith<ErrorGallery> get copyWith =>
      _$ErrorGalleryCopyWithImpl<ErrorGallery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Gallery gallery) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Gallery gallery)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Gallery gallery)? success,
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
    required TResult Function(SuccessGallery value) success,
    required TResult Function(ErrorGallery value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessGallery value)? success,
    TResult Function(ErrorGallery value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessGallery value)? success,
    TResult Function(ErrorGallery value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorGallery implements GalleryResult {
  const factory ErrorGallery(int code, String msg) = _$ErrorGallery;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorGalleryCopyWith<ErrorGallery> get copyWith =>
      throw _privateConstructorUsedError;
}
