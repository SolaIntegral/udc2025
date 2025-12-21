// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyUserModelImpl _$$NearbyUserModelImplFromJson(
  Map<String, dynamic> json,
) => _$NearbyUserModelImpl(
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  distance: (json['distance'] as num).toDouble(),
  discoveredAt: DateTime.parse(json['discoveredAt'] as String),
  isTrustedGroupMember: json['isTrustedGroupMember'] as bool? ?? false,
);

Map<String, dynamic> _$$NearbyUserModelImplToJson(
  _$NearbyUserModelImpl instance,
) => <String, dynamic>{
  'user': instance.user,
  'distance': instance.distance,
  'discoveredAt': instance.discoveredAt.toIso8601String(),
  'isTrustedGroupMember': instance.isTrustedGroupMember,
};
