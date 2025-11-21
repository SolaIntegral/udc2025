// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$emergencyStatusHash() => r'3bec56720dcc5d93ec0ec3f266b70b1b44025506';

/// 安否ステータスプロバイダー
///
/// Copied from [EmergencyStatus].
@ProviderFor(EmergencyStatus)
final emergencyStatusProvider =
    AutoDisposeNotifierProvider<
      EmergencyStatus,
      EmergencyStatusModel?
    >.internal(
      EmergencyStatus.new,
      name: r'emergencyStatusProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$emergencyStatusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$EmergencyStatus = AutoDisposeNotifier<EmergencyStatusModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
