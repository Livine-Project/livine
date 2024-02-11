// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserCookingListHash() =>
    r'6aa6a9634ad765fe5f062e6b0f74c1b57774a5b4';

/// See also [getUserCookingList].
@ProviderFor(getUserCookingList)
final getUserCookingListProvider =
    AutoDisposeFutureProvider<List<Recipe>>.internal(
  getUserCookingList,
  name: r'getUserCookingListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserCookingListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserCookingListRef = AutoDisposeFutureProviderRef<List<Recipe>>;
String _$addCookingListHash() => r'5fb51d4b3640002ab23ad2fb9c7c45d485c08e9d';

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

/// See also [addCookingList].
@ProviderFor(addCookingList)
const addCookingListProvider = AddCookingListFamily();

/// See also [addCookingList].
class AddCookingListFamily extends Family<AsyncValue<bool>> {
  /// See also [addCookingList].
  const AddCookingListFamily();

  /// See also [addCookingList].
  AddCookingListProvider call({
    required int recipeID,
  }) {
    return AddCookingListProvider(
      recipeID: recipeID,
    );
  }

  @override
  AddCookingListProvider getProviderOverride(
    covariant AddCookingListProvider provider,
  ) {
    return call(
      recipeID: provider.recipeID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addCookingListProvider';
}

/// See also [addCookingList].
class AddCookingListProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [addCookingList].
  AddCookingListProvider({
    required int recipeID,
  }) : this._internal(
          (ref) => addCookingList(
            ref as AddCookingListRef,
            recipeID: recipeID,
          ),
          from: addCookingListProvider,
          name: r'addCookingListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addCookingListHash,
          dependencies: AddCookingListFamily._dependencies,
          allTransitiveDependencies:
              AddCookingListFamily._allTransitiveDependencies,
          recipeID: recipeID,
        );

  AddCookingListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeID,
  }) : super.internal();

  final int recipeID;

  @override
  Override overrideWith(
    FutureOr<bool> Function(AddCookingListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddCookingListProvider._internal(
        (ref) => create(ref as AddCookingListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeID: recipeID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _AddCookingListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddCookingListProvider && other.recipeID == recipeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddCookingListRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `recipeID` of this provider.
  int get recipeID;
}

class _AddCookingListProviderElement
    extends AutoDisposeFutureProviderElement<bool> with AddCookingListRef {
  _AddCookingListProviderElement(super.provider);

  @override
  int get recipeID => (origin as AddCookingListProvider).recipeID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
