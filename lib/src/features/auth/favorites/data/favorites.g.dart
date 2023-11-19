// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFavoritesHash() => r'6762a084c6eaeba0925e26bcf70eb48eb895eb45';

/// See also [getFavorites].
@ProviderFor(getFavorites)
final getFavoritesProvider = AutoDisposeFutureProvider<List<Recipe>>.internal(
  getFavorites,
  name: r'getFavoritesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getFavoritesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFavoritesRef = AutoDisposeFutureProviderRef<List<Recipe>>;
String _$addFavoriteHash() => r'733d66e714d7e652e7d48f1f0659405c128341a6';

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

/// See also [addFavorite].
@ProviderFor(addFavorite)
const addFavoriteProvider = AddFavoriteFamily();

/// See also [addFavorite].
class AddFavoriteFamily extends Family<AsyncValue<void>> {
  /// See also [addFavorite].
  const AddFavoriteFamily();

  /// See also [addFavorite].
  AddFavoriteProvider call({
    required int recipeID,
  }) {
    return AddFavoriteProvider(
      recipeID: recipeID,
    );
  }

  @override
  AddFavoriteProvider getProviderOverride(
    covariant AddFavoriteProvider provider,
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
  String? get name => r'addFavoriteProvider';
}

/// See also [addFavorite].
class AddFavoriteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addFavorite].
  AddFavoriteProvider({
    required int recipeID,
  }) : this._internal(
          (ref) => addFavorite(
            ref as AddFavoriteRef,
            recipeID: recipeID,
          ),
          from: addFavoriteProvider,
          name: r'addFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addFavoriteHash,
          dependencies: AddFavoriteFamily._dependencies,
          allTransitiveDependencies:
              AddFavoriteFamily._allTransitiveDependencies,
          recipeID: recipeID,
        );

  AddFavoriteProvider._internal(
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
    FutureOr<void> Function(AddFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddFavoriteProvider._internal(
        (ref) => create(ref as AddFavoriteRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddFavoriteProvider && other.recipeID == recipeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddFavoriteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `recipeID` of this provider.
  int get recipeID;
}

class _AddFavoriteProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddFavoriteRef {
  _AddFavoriteProviderElement(super.provider);

  @override
  int get recipeID => (origin as AddFavoriteProvider).recipeID;
}

String _$deleteFavoriteHash() => r'1a5a6dd50d9f4122a069d1f4075a90d27e1b3fe7';

/// See also [deleteFavorite].
@ProviderFor(deleteFavorite)
const deleteFavoriteProvider = DeleteFavoriteFamily();

/// See also [deleteFavorite].
class DeleteFavoriteFamily extends Family<AsyncValue<void>> {
  /// See also [deleteFavorite].
  const DeleteFavoriteFamily();

  /// See also [deleteFavorite].
  DeleteFavoriteProvider call({
    required int recipeID,
  }) {
    return DeleteFavoriteProvider(
      recipeID: recipeID,
    );
  }

  @override
  DeleteFavoriteProvider getProviderOverride(
    covariant DeleteFavoriteProvider provider,
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
  String? get name => r'deleteFavoriteProvider';
}

/// See also [deleteFavorite].
class DeleteFavoriteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteFavorite].
  DeleteFavoriteProvider({
    required int recipeID,
  }) : this._internal(
          (ref) => deleteFavorite(
            ref as DeleteFavoriteRef,
            recipeID: recipeID,
          ),
          from: deleteFavoriteProvider,
          name: r'deleteFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteFavoriteHash,
          dependencies: DeleteFavoriteFamily._dependencies,
          allTransitiveDependencies:
              DeleteFavoriteFamily._allTransitiveDependencies,
          recipeID: recipeID,
        );

  DeleteFavoriteProvider._internal(
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
    FutureOr<void> Function(DeleteFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteFavoriteProvider._internal(
        (ref) => create(ref as DeleteFavoriteRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFavoriteProvider && other.recipeID == recipeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteFavoriteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `recipeID` of this provider.
  int get recipeID;
}

class _DeleteFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteFavoriteRef {
  _DeleteFavoriteProviderElement(super.provider);

  @override
  int get recipeID => (origin as DeleteFavoriteProvider).recipeID;
}

String _$isFavoritedHash() => r'bfea33b1dbfa5828d615b3d5ecc8af4501d31728';

/// See also [isFavorited].
@ProviderFor(isFavorited)
const isFavoritedProvider = IsFavoritedFamily();

/// See also [isFavorited].
class IsFavoritedFamily extends Family<AsyncValue<String>> {
  /// See also [isFavorited].
  const IsFavoritedFamily();

  /// See also [isFavorited].
  IsFavoritedProvider call({
    required int id,
  }) {
    return IsFavoritedProvider(
      id: id,
    );
  }

  @override
  IsFavoritedProvider getProviderOverride(
    covariant IsFavoritedProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'isFavoritedProvider';
}

/// See also [isFavorited].
class IsFavoritedProvider extends AutoDisposeFutureProvider<String> {
  /// See also [isFavorited].
  IsFavoritedProvider({
    required int id,
  }) : this._internal(
          (ref) => isFavorited(
            ref as IsFavoritedRef,
            id: id,
          ),
          from: isFavoritedProvider,
          name: r'isFavoritedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavoritedHash,
          dependencies: IsFavoritedFamily._dependencies,
          allTransitiveDependencies:
              IsFavoritedFamily._allTransitiveDependencies,
          id: id,
        );

  IsFavoritedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<String> Function(IsFavoritedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavoritedProvider._internal(
        (ref) => create(ref as IsFavoritedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _IsFavoritedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoritedProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFavoritedRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;
}

class _IsFavoritedProviderElement
    extends AutoDisposeFutureProviderElement<String> with IsFavoritedRef {
  _IsFavoritedProviderElement(super.provider);

  @override
  int get id => (origin as IsFavoritedProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
