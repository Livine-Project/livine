// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFavoritesHash() => r'25ef05d5eb37798fca37568e88253517a425806c';

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

/// See also [getFavorites].
@ProviderFor(getFavorites)
const getFavoritesProvider = GetFavoritesFamily();

/// See also [getFavorites].
class GetFavoritesFamily extends Family<AsyncValue<FavoritesData>> {
  /// See also [getFavorites].
  const GetFavoritesFamily();

  /// See also [getFavorites].
  GetFavoritesProvider call({
    required BuildContext context,
  }) {
    return GetFavoritesProvider(
      context: context,
    );
  }

  @override
  GetFavoritesProvider getProviderOverride(
    covariant GetFavoritesProvider provider,
  ) {
    return call(
      context: provider.context,
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
  String? get name => r'getFavoritesProvider';
}

/// See also [getFavorites].
class GetFavoritesProvider extends AutoDisposeFutureProvider<FavoritesData> {
  /// See also [getFavorites].
  GetFavoritesProvider({
    required BuildContext context,
  }) : this._internal(
          (ref) => getFavorites(
            ref as GetFavoritesRef,
            context: context,
          ),
          from: getFavoritesProvider,
          name: r'getFavoritesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFavoritesHash,
          dependencies: GetFavoritesFamily._dependencies,
          allTransitiveDependencies:
              GetFavoritesFamily._allTransitiveDependencies,
          context: context,
        );

  GetFavoritesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<FavoritesData> Function(GetFavoritesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFavoritesProvider._internal(
        (ref) => create(ref as GetFavoritesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FavoritesData> createElement() {
    return _GetFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFavoritesProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFavoritesRef on AutoDisposeFutureProviderRef<FavoritesData> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _GetFavoritesProviderElement
    extends AutoDisposeFutureProviderElement<FavoritesData>
    with GetFavoritesRef {
  _GetFavoritesProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetFavoritesProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
