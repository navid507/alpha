// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MedicalsResultTearOff {
  const _$MedicalsResultTearOff();

  SuccessMedicals success(List<Medical> medicalsSessions) {
    return SuccessMedicals(
      medicalsSessions,
    );
  }

  ErrorMedicals error(int code, String msg) {
    return ErrorMedicals(
      code,
      msg,
    );
  }
}

/// @nodoc
const $MedicalsResult = _$MedicalsResultTearOff();

/// @nodoc
mixin _$MedicalsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Medical> medicalsSessions) success,
    required TResult Function(int code, String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Medical> medicalsSessions)? success,
    TResult Function(int code, String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Medical> medicalsSessions)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessMedicals value) success,
    required TResult Function(ErrorMedicals value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessMedicals value)? success,
    TResult Function(ErrorMedicals value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessMedicals value)? success,
    TResult Function(ErrorMedicals value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalsResultCopyWith<$Res> {
  factory $MedicalsResultCopyWith(
          MedicalsResult value, $Res Function(MedicalsResult) then) =
      _$MedicalsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$MedicalsResultCopyWithImpl<$Res>
    implements $MedicalsResultCopyWith<$Res> {
  _$MedicalsResultCopyWithImpl(this._value, this._then);

  final MedicalsResult _value;
  // ignore: unused_field
  final $Res Function(MedicalsResult) _then;
}

/// @nodoc
abstract class $SuccessMedicalsCopyWith<$Res> {
  factory $SuccessMedicalsCopyWith(
          SuccessMedicals value, $Res Function(SuccessMedicals) then) =
      _$SuccessMedicalsCopyWithImpl<$Res>;
  $Res call({List<Medical> medicalsSessions});
}

/// @nodoc
class _$SuccessMedicalsCopyWithImpl<$Res>
    extends _$MedicalsResultCopyWithImpl<$Res>
    implements $SuccessMedicalsCopyWith<$Res> {
  _$SuccessMedicalsCopyWithImpl(
      SuccessMedicals _value, $Res Function(SuccessMedicals) _then)
      : super(_value, (v) => _then(v as SuccessMedicals));

  @override
  SuccessMedicals get _value => super._value as SuccessMedicals;

  @override
  $Res call({
    Object? medicalsSessions = freezed,
  }) {
    return _then(SuccessMedicals(
      medicalsSessions == freezed
          ? _value.medicalsSessions
          : medicalsSessions // ignore: cast_nullable_to_non_nullable
              as List<Medical>,
    ));
  }
}

/// @nodoc

class _$SuccessMedicals
    with DiagnosticableTreeMixin
    implements SuccessMedicals {
  const _$SuccessMedicals(this.medicalsSessions);

  @override
  final List<Medical> medicalsSessions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MedicalsResult.success(medicalsSessions: $medicalsSessions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MedicalsResult.success'))
      ..add(DiagnosticsProperty('medicalsSessions', medicalsSessions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessMedicals &&
            const DeepCollectionEquality()
                .equals(other.medicalsSessions, medicalsSessions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(medicalsSessions));

  @JsonKey(ignore: true)
  @override
  $SuccessMedicalsCopyWith<SuccessMedicals> get copyWith =>
      _$SuccessMedicalsCopyWithImpl<SuccessMedicals>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Medical> medicalsSessions) success,
    required TResult Function(int code, String msg) error,
  }) {
    return success(medicalsSessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Medical> medicalsSessions)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return success?.call(medicalsSessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Medical> medicalsSessions)? success,
    TResult Function(int code, String msg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(medicalsSessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessMedicals value) success,
    required TResult Function(ErrorMedicals value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessMedicals value)? success,
    TResult Function(ErrorMedicals value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessMedicals value)? success,
    TResult Function(ErrorMedicals value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessMedicals implements MedicalsResult {
  const factory SuccessMedicals(List<Medical> medicalsSessions) =
      _$SuccessMedicals;

  List<Medical> get medicalsSessions;
  @JsonKey(ignore: true)
  $SuccessMedicalsCopyWith<SuccessMedicals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorMedicalsCopyWith<$Res> {
  factory $ErrorMedicalsCopyWith(
          ErrorMedicals value, $Res Function(ErrorMedicals) then) =
      _$ErrorMedicalsCopyWithImpl<$Res>;
  $Res call({int code, String msg});
}

/// @nodoc
class _$ErrorMedicalsCopyWithImpl<$Res>
    extends _$MedicalsResultCopyWithImpl<$Res>
    implements $ErrorMedicalsCopyWith<$Res> {
  _$ErrorMedicalsCopyWithImpl(
      ErrorMedicals _value, $Res Function(ErrorMedicals) _then)
      : super(_value, (v) => _then(v as ErrorMedicals));

  @override
  ErrorMedicals get _value => super._value as ErrorMedicals;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(ErrorMedicals(
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

class _$ErrorMedicals with DiagnosticableTreeMixin implements ErrorMedicals {
  const _$ErrorMedicals(this.code, this.msg);

  @override
  final int code;
  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MedicalsResult.error(code: $code, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MedicalsResult.error'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorMedicals &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, msg);

  @JsonKey(ignore: true)
  @override
  $ErrorMedicalsCopyWith<ErrorMedicals> get copyWith =>
      _$ErrorMedicalsCopyWithImpl<ErrorMedicals>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Medical> medicalsSessions) success,
    required TResult Function(int code, String msg) error,
  }) {
    return error(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Medical> medicalsSessions)? success,
    TResult Function(int code, String msg)? error,
  }) {
    return error?.call(code, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Medical> medicalsSessions)? success,
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
    required TResult Function(SuccessMedicals value) success,
    required TResult Function(ErrorMedicals value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessMedicals value)? success,
    TResult Function(ErrorMedicals value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessMedicals value)? success,
    TResult Function(ErrorMedicals value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorMedicals implements MedicalsResult {
  const factory ErrorMedicals(int code, String msg) = _$ErrorMedicals;

  int get code;
  String get msg;
  @JsonKey(ignore: true)
  $ErrorMedicalsCopyWith<ErrorMedicals> get copyWith =>
      throw _privateConstructorUsedError;
}
