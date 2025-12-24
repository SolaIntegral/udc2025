// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmergencyStatusModel _$EmergencyStatusModelFromJson(Map<String, dynamic> json) {
  return _EmergencyStatusModel.fromJson(json);
}

/// @nodoc
mixin _$EmergencyStatusModel {
  String get userId => throw _privateConstructorUsedError;
  EmergencyStatusType get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this EmergencyStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmergencyStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmergencyStatusModelCopyWith<EmergencyStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyStatusModelCopyWith<$Res> {
  factory $EmergencyStatusModelCopyWith(
    EmergencyStatusModel value,
    $Res Function(EmergencyStatusModel) then,
  ) = _$EmergencyStatusModelCopyWithImpl<$Res, EmergencyStatusModel>;
  @useResult
  $Res call({
    String userId,
    EmergencyStatusType status,
    String? message,
    DateTime timestamp,
  });
}

/// @nodoc
class _$EmergencyStatusModelCopyWithImpl<
  $Res,
  $Val extends EmergencyStatusModel
>
    implements $EmergencyStatusModelCopyWith<$Res> {
  _$EmergencyStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? message = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as EmergencyStatusType,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmergencyStatusModelImplCopyWith<$Res>
    implements $EmergencyStatusModelCopyWith<$Res> {
  factory _$$EmergencyStatusModelImplCopyWith(
    _$EmergencyStatusModelImpl value,
    $Res Function(_$EmergencyStatusModelImpl) then,
  ) = __$$EmergencyStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    EmergencyStatusType status,
    String? message,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$EmergencyStatusModelImplCopyWithImpl<$Res>
    extends _$EmergencyStatusModelCopyWithImpl<$Res, _$EmergencyStatusModelImpl>
    implements _$$EmergencyStatusModelImplCopyWith<$Res> {
  __$$EmergencyStatusModelImplCopyWithImpl(
    _$EmergencyStatusModelImpl _value,
    $Res Function(_$EmergencyStatusModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmergencyStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? message = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _$EmergencyStatusModelImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as EmergencyStatusType,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyStatusModelImpl implements _EmergencyStatusModel {
  const _$EmergencyStatusModelImpl({
    required this.userId,
    required this.status,
    this.message,
    required this.timestamp,
  });

  factory _$EmergencyStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyStatusModelImplFromJson(json);

  @override
  final String userId;
  @override
  final EmergencyStatusType status;
  @override
  final String? message;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'EmergencyStatusModel(userId: $userId, status: $status, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyStatusModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, status, message, timestamp);

  /// Create a copy of EmergencyStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyStatusModelImplCopyWith<_$EmergencyStatusModelImpl>
  get copyWith =>
      __$$EmergencyStatusModelImplCopyWithImpl<_$EmergencyStatusModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyStatusModelImplToJson(this);
  }
}

abstract class _EmergencyStatusModel implements EmergencyStatusModel {
  const factory _EmergencyStatusModel({
    required final String userId,
    required final EmergencyStatusType status,
    final String? message,
    required final DateTime timestamp,
  }) = _$EmergencyStatusModelImpl;

  factory _EmergencyStatusModel.fromJson(Map<String, dynamic> json) =
      _$EmergencyStatusModelImpl.fromJson;

  @override
  String get userId;
  @override
  EmergencyStatusType get status;
  @override
  String? get message;
  @override
  DateTime get timestamp;

  /// Create a copy of EmergencyStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencyStatusModelImplCopyWith<_$EmergencyStatusModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
