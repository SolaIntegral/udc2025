// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bluetoothStateHash() => r'2232079f0d4a3897de2964d9b8fcafe4595d66f5';

/// Bluetoothプロバイダー
///
/// Copied from [BluetoothState].
@ProviderFor(BluetoothState)
final bluetoothStateProvider =
    AutoDisposeNotifierProvider<
      BluetoothState,
      BluetoothConnectionState
    >.internal(
      BluetoothState.new,
      name: r'bluetoothStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bluetoothStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BluetoothState = AutoDisposeNotifier<BluetoothConnectionState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
