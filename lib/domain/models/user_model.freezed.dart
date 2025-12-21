// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError; // デフォルトは日本語
  bool get isVulnerable => throw _privateConstructorUsedError; // 避難弱者フラグ
  String? get profileImageUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt =>
      throw _privateConstructorUsedError; // コミュニティ機能用の拡張フィールド
  String? get nationality => throw _privateConstructorUsedError; // 国籍
  String? get religiousConsiderations =>
      throw _privateConstructorUsedError; // 宗教的配慮（ハラールなど）
  List<String>? get needs =>
      throw _privateConstructorUsedError; // 支援が必要な事項（持病、妊娠中など）
  List<String>? get skills =>
      throw _privateConstructorUsedError; // スキルリスト（「力仕事ができます」「応急処置ができます」など）
  UserStatus get status => throw _privateConstructorUsedError; // 現在のステータス
  int get batteryLevel => throw _privateConstructorUsedError; // バッテリー残量（%）
  double? get latitude => throw _privateConstructorUsedError; // 現在位置（緯度）
  double? get longitude => throw _privateConstructorUsedError; // 現在位置（経度）
  DateTime? get lastSeenAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String language,
    bool isVulnerable,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? nationality,
    String? religiousConsiderations,
    List<String>? needs,
    List<String>? skills,
    UserStatus status,
    int batteryLevel,
    double? latitude,
    double? longitude,
    DateTime? lastSeenAt,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? language = null,
    Object? isVulnerable = null,
    Object? profileImageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nationality = freezed,
    Object? religiousConsiderations = freezed,
    Object? needs = freezed,
    Object? skills = freezed,
    Object? status = null,
    Object? batteryLevel = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? lastSeenAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            isVulnerable: null == isVulnerable
                ? _value.isVulnerable
                : isVulnerable // ignore: cast_nullable_to_non_nullable
                      as bool,
            profileImageUrl: freezed == profileImageUrl
                ? _value.profileImageUrl
                : profileImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            nationality: freezed == nationality
                ? _value.nationality
                : nationality // ignore: cast_nullable_to_non_nullable
                      as String?,
            religiousConsiderations: freezed == religiousConsiderations
                ? _value.religiousConsiderations
                : religiousConsiderations // ignore: cast_nullable_to_non_nullable
                      as String?,
            needs: freezed == needs
                ? _value.needs
                : needs // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            skills: freezed == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as UserStatus,
            batteryLevel: null == batteryLevel
                ? _value.batteryLevel
                : batteryLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            lastSeenAt: freezed == lastSeenAt
                ? _value.lastSeenAt
                : lastSeenAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String language,
    bool isVulnerable,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? nationality,
    String? religiousConsiderations,
    List<String>? needs,
    List<String>? skills,
    UserStatus status,
    int batteryLevel,
    double? latitude,
    double? longitude,
    DateTime? lastSeenAt,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? language = null,
    Object? isVulnerable = null,
    Object? profileImageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nationality = freezed,
    Object? religiousConsiderations = freezed,
    Object? needs = freezed,
    Object? skills = freezed,
    Object? status = null,
    Object? batteryLevel = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? lastSeenAt = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        isVulnerable: null == isVulnerable
            ? _value.isVulnerable
            : isVulnerable // ignore: cast_nullable_to_non_nullable
                  as bool,
        profileImageUrl: freezed == profileImageUrl
            ? _value.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        nationality: freezed == nationality
            ? _value.nationality
            : nationality // ignore: cast_nullable_to_non_nullable
                  as String?,
        religiousConsiderations: freezed == religiousConsiderations
            ? _value.religiousConsiderations
            : religiousConsiderations // ignore: cast_nullable_to_non_nullable
                  as String?,
        needs: freezed == needs
            ? _value._needs
            : needs // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        skills: freezed == skills
            ? _value._skills
            : skills // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus,
        batteryLevel: null == batteryLevel
            ? _value.batteryLevel
            : batteryLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        lastSeenAt: freezed == lastSeenAt
            ? _value.lastSeenAt
            : lastSeenAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    required this.id,
    required this.name,
    this.language = 'ja',
    this.isVulnerable = false,
    this.profileImageUrl,
    this.createdAt,
    this.updatedAt,
    this.nationality,
    this.religiousConsiderations,
    final List<String>? needs,
    final List<String>? skills,
    this.status = UserStatus.unknown,
    this.batteryLevel = 100,
    this.latitude,
    this.longitude,
    this.lastSeenAt,
  }) : _needs = needs,
       _skills = skills;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final String language;
  // デフォルトは日本語
  @override
  @JsonKey()
  final bool isVulnerable;
  // 避難弱者フラグ
  @override
  final String? profileImageUrl;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  // コミュニティ機能用の拡張フィールド
  @override
  final String? nationality;
  // 国籍
  @override
  final String? religiousConsiderations;
  // 宗教的配慮（ハラールなど）
  final List<String>? _needs;
  // 宗教的配慮（ハラールなど）
  @override
  List<String>? get needs {
    final value = _needs;
    if (value == null) return null;
    if (_needs is EqualUnmodifiableListView) return _needs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // 支援が必要な事項（持病、妊娠中など）
  final List<String>? _skills;
  // 支援が必要な事項（持病、妊娠中など）
  @override
  List<String>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // スキルリスト（「力仕事ができます」「応急処置ができます」など）
  @override
  @JsonKey()
  final UserStatus status;
  // 現在のステータス
  @override
  @JsonKey()
  final int batteryLevel;
  // バッテリー残量（%）
  @override
  final double? latitude;
  // 現在位置（緯度）
  @override
  final double? longitude;
  // 現在位置（経度）
  @override
  final DateTime? lastSeenAt;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, language: $language, isVulnerable: $isVulnerable, profileImageUrl: $profileImageUrl, createdAt: $createdAt, updatedAt: $updatedAt, nationality: $nationality, religiousConsiderations: $religiousConsiderations, needs: $needs, skills: $skills, status: $status, batteryLevel: $batteryLevel, latitude: $latitude, longitude: $longitude, lastSeenAt: $lastSeenAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.isVulnerable, isVulnerable) ||
                other.isVulnerable == isVulnerable) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(
                  other.religiousConsiderations,
                  religiousConsiderations,
                ) ||
                other.religiousConsiderations == religiousConsiderations) &&
            const DeepCollectionEquality().equals(other._needs, _needs) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    language,
    isVulnerable,
    profileImageUrl,
    createdAt,
    updatedAt,
    nationality,
    religiousConsiderations,
    const DeepCollectionEquality().hash(_needs),
    const DeepCollectionEquality().hash(_skills),
    status,
    batteryLevel,
    latitude,
    longitude,
    lastSeenAt,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final String id,
    required final String name,
    final String language,
    final bool isVulnerable,
    final String? profileImageUrl,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final String? nationality,
    final String? religiousConsiderations,
    final List<String>? needs,
    final List<String>? skills,
    final UserStatus status,
    final int batteryLevel,
    final double? latitude,
    final double? longitude,
    final DateTime? lastSeenAt,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get language; // デフォルトは日本語
  @override
  bool get isVulnerable; // 避難弱者フラグ
  @override
  String? get profileImageUrl;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt; // コミュニティ機能用の拡張フィールド
  @override
  String? get nationality; // 国籍
  @override
  String? get religiousConsiderations; // 宗教的配慮（ハラールなど）
  @override
  List<String>? get needs; // 支援が必要な事項（持病、妊娠中など）
  @override
  List<String>? get skills; // スキルリスト（「力仕事ができます」「応急処置ができます」など）
  @override
  UserStatus get status; // 現在のステータス
  @override
  int get batteryLevel; // バッテリー残量（%）
  @override
  double? get latitude; // 現在位置（緯度）
  @override
  double? get longitude; // 現在位置（経度）
  @override
  DateTime? get lastSeenAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
