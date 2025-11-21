// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupRepositoryHash() => r'bf89d04afc9d50fcdfdf3038118e1133413496eb';

/// グループリポジトリプロバイダー
///
/// Copied from [groupRepository].
@ProviderFor(groupRepository)
final groupRepositoryProvider = AutoDisposeProvider<GroupRepository>.internal(
  groupRepository,
  name: r'groupRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GroupRepositoryRef = AutoDisposeProviderRef<GroupRepository>;
String _$groupListHash() => r'52ef84faf6b73a7052be684c7eb5fd1b29e7fd44';

/// グループ一覧プロバイダー
///
/// Copied from [groupList].
@ProviderFor(groupList)
final groupListProvider = AutoDisposeFutureProvider<List<GroupModel>>.internal(
  groupList,
  name: r'groupListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GroupListRef = AutoDisposeFutureProviderRef<List<GroupModel>>;
String _$groupHash() => r'cb177574b93ed7853d968412ef0d5d4832c4cc0b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// グループプロバイダー
///
/// Copied from [group].
@ProviderFor(group)
const groupProvider = GroupFamily();

/// グループプロバイダー
///
/// Copied from [group].
class GroupFamily extends Family<AsyncValue<GroupModel?>> {
  /// グループプロバイダー
  ///
  /// Copied from [group].
  const GroupFamily();

  /// グループプロバイダー
  ///
  /// Copied from [group].
  GroupProvider call(String groupId) {
    return GroupProvider(groupId);
  }

  @override
  GroupProvider getProviderOverride(covariant GroupProvider provider) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupProvider';
}

/// グループプロバイダー
///
/// Copied from [group].
class GroupProvider extends AutoDisposeFutureProvider<GroupModel?> {
  /// グループプロバイダー
  ///
  /// Copied from [group].
  GroupProvider(String groupId)
    : this._internal(
        (ref) => group(ref as GroupRef, groupId),
        from: groupProvider,
        name: r'groupProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupHash,
        dependencies: GroupFamily._dependencies,
        allTransitiveDependencies: GroupFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    FutureOr<GroupModel?> Function(GroupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupProvider._internal(
        (ref) => create(ref as GroupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GroupModel?> createElement() {
    return _GroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupRef on AutoDisposeFutureProviderRef<GroupModel?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupProviderElement
    extends AutoDisposeFutureProviderElement<GroupModel?>
    with GroupRef {
  _GroupProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupProvider).groupId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
