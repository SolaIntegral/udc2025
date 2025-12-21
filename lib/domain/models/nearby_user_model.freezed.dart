// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NearbyUserModel _$NearbyUserModelFromJson(Map<String, dynamic> json) {
  return _NearbyUserModel.fromJson(json);
}

/// @nodoc
mixin _$NearbyUserModel {
  UserModel get user => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError; // 距離（メートル）
  DateTime get discoveredAt => throw _privateConstructorUsedError; // 発見時刻
  bool get isTrustedGroupMember => throw _privateConstructorUsedError;

  /// Serializes this NearbyUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyUserModelCopyWith<NearbyUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyUserModelCopyWith<$Res> {
  factory $NearbyUserModelCopyWith(
    NearbyUserModel value,
    $Res Function(NearbyUserModel) then,
  ) = _$NearbyUserModelCopyWithImpl<$Res, NearbyUserModel>;
  @useResult
  $Res call({
    UserModel user,
    double distance,
    DateTime discoveredAt,
    bool isTrustedGroupMember,
  });

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$NearbyUserModelCopyWithImpl<$Res, $Val extends NearbyUserModel>
    implements $NearbyUserModelCopyWith<$Res> {
  _$NearbyUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? distance = null,
    Object? discoveredAt = null,
    Object? isTrustedGroupMember = null,
  }) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            distance: null == distance
                ? _value.distance
                : distance // ignore: cast_nullable_to_non_nullable
                      as double,
            discoveredAt: null == discoveredAt
                ? _value.discoveredAt
                : discoveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isTrustedGroupMember: null == isTrustedGroupMember
                ? _value.isTrustedGroupMember
                : isTrustedGroupMember // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of NearbyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearbyUserModelImplCopyWith<$Res>
    implements $NearbyUserModelCopyWith<$Res> {
  factory _$$NearbyUserModelImplCopyWith(
    _$NearbyUserModelImpl value,
    $Res Function(_$NearbyUserModelImpl) then,
  ) = __$$NearbyUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserModel user,
    double distance,
    DateTime discoveredAt,
    bool isTrustedGroupMember,
  });

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$NearbyUserModelImplCopyWithImpl<$Res>
    extends _$NearbyUserModelCopyWithImpl<$Res, _$NearbyUserModelImpl>
    implements _$$NearbyUserModelImplCopyWith<$Res> {
  __$$NearbyUserModelImplCopyWithImpl(
    _$NearbyUserModelImpl _value,
    $Res Function(_$NearbyUserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NearbyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? distance = null,
    Object? discoveredAt = null,
    Object? isTrustedGroupMember = null,
  }) {
    return _then(
      _$NearbyUserModelImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        distance: null == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as double,
        discoveredAt: null == discoveredAt
            ? _value.discoveredAt
            : discoveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isTrustedGroupMember: null == isTrustedGroupMember
            ? _value.isTrustedGroupMember
            : isTrustedGroupMember // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyUserModelImpl implements _NearbyUserModel {
  const _$NearbyUserModelImpl({
    required this.user,
    required this.distance,
    required this.discoveredAt,
    this.isTrustedGroupMember = false,
  });

  factory _$NearbyUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyUserModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final double distance;
  // 距離（メートル）
  @override
  final DateTime discoveredAt;
  // 発見時刻
  @override
  @JsonKey()
  final bool isTrustedGroupMember;

  @override
  String toString() {
    return 'NearbyUserModel(user: $user, distance: $distance, discoveredAt: $discoveredAt, isTrustedGroupMember: $isTrustedGroupMember)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyUserModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.discoveredAt, discoveredAt) ||
                other.discoveredAt == discoveredAt) &&
            (identical(other.isTrustedGroupMember, isTrustedGroupMember) ||
                other.isTrustedGroupMember == isTrustedGroupMember));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    distance,
    discoveredAt,
    isTrustedGroupMember,
  );

  /// Create a copy of NearbyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyUserModelImplCopyWith<_$NearbyUserModelImpl> get copyWith =>
      __$$NearbyUserModelImplCopyWithImpl<_$NearbyUserModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyUserModelImplToJson(this);
  }
}

abstract class _NearbyUserModel implements NearbyUserModel {
  const factory _NearbyUserModel({
    required final UserModel user,
    required final double distance,
    required final DateTime discoveredAt,
    final bool isTrustedGroupMember,
  }) = _$NearbyUserModelImpl;

  factory _NearbyUserModel.fromJson(Map<String, dynamic> json) =
      _$NearbyUserModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  double get distance; // 距離（メートル）
  @override
  DateTime get discoveredAt; // 発見時刻
  @override
  bool get isTrustedGroupMember;

  /// Create a copy of NearbyUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyUserModelImplCopyWith<_$NearbyUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
