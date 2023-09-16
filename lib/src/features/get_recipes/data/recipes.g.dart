// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipesDetailsHash() => r'0f959832e5dee7b167de4ccab7904e32ba923079';

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

/// See also [recipesDetails].
@ProviderFor(recipesDetails)
const recipesDetailsProvider = RecipesDetailsFamily();

/// See also [recipesDetails].
class RecipesDetailsFamily extends Family<AsyncValue<Recipe>> {
  /// See also [recipesDetails].
  const RecipesDetailsFamily();

  /// See also [recipesDetails].
  RecipesDetailsProvider call({
    required int id,
    required BuildContext context,
  }) {
    return RecipesDetailsProvider(
      id: id,
      context: context,
    );
  }

  @override
  RecipesDetailsProvider getProviderOverride(
    covariant RecipesDetailsProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'recipesDetailsProvider';
}

/// See also [recipesDetails].
class RecipesDetailsProvider extends AutoDisposeFutureProvider<Recipe> {
  /// See also [recipesDetails].
  RecipesDetailsProvider({
    required int id,
    required BuildContext context,
  }) : this._internal(
          (ref) => recipesDetails(
            ref as RecipesDetailsRef,
            id: id,
            context: context,
          ),
          from: recipesDetailsProvider,
          name: r'recipesDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipesDetailsHash,
          dependencies: RecipesDetailsFamily._dependencies,
          allTransitiveDependencies:
              RecipesDetailsFamily._allTransitiveDependencies,
          id: id,
          context: context,
        );

  RecipesDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.context,
  }) : super.internal();

  final int id;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<Recipe> Function(RecipesDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipesDetailsProvider._internal(
        (ref) => create(ref as RecipesDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Recipe> createElement() {
    return _RecipesDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipesDetailsProvider &&
        other.id == id &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecipesDetailsRef on AutoDisposeFutureProviderRef<Recipe> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _RecipesDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Recipe> with RecipesDetailsRef {
  _RecipesDetailsProviderElement(super.provider);

  @override
  int get id => (origin as RecipesDetailsProvider).id;
  @override
  BuildContext get context => (origin as RecipesDetailsProvider).context;
}

String _$getRecipesHash() => r'844c07cc8dc308590cc248d2bc4f5b041a8b9b95';

/// See also [getRecipes].
@ProviderFor(getRecipes)
const getRecipesProvider = GetRecipesFamily();

/// See also [getRecipes].
class GetRecipesFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getRecipes].
  const GetRecipesFamily();

  /// See also [getRecipes].
  GetRecipesProvider call({
    required int id,
    required int pageKey,
    required BuildContext context,
  }) {
    return GetRecipesProvider(
      id: id,
      pageKey: pageKey,
      context: context,
    );
  }

  @override
  GetRecipesProvider getProviderOverride(
    covariant GetRecipesProvider provider,
  ) {
    return call(
      id: provider.id,
      pageKey: provider.pageKey,
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
  String? get name => r'getRecipesProvider';
}

/// See also [getRecipes].
class GetRecipesProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getRecipes].
  GetRecipesProvider({
    required int id,
    required int pageKey,
    required BuildContext context,
  }) : this._internal(
          (ref) => getRecipes(
            ref as GetRecipesRef,
            id: id,
            pageKey: pageKey,
            context: context,
          ),
          from: getRecipesProvider,
          name: r'getRecipesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRecipesHash,
          dependencies: GetRecipesFamily._dependencies,
          allTransitiveDependencies:
              GetRecipesFamily._allTransitiveDependencies,
          id: id,
          pageKey: pageKey,
          context: context,
        );

  GetRecipesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.pageKey,
    required this.context,
  }) : super.internal();

  final int id;
  final int pageKey;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetRecipesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRecipesProvider._internal(
        (ref) => create(ref as GetRecipesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        pageKey: pageKey,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetRecipesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRecipesProvider &&
        other.id == id &&
        other.pageKey == pageKey &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, pageKey.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetRecipesRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `pageKey` of this provider.
  int get pageKey;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _GetRecipesProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetRecipesRef {
  _GetRecipesProviderElement(super.provider);

  @override
  int get id => (origin as GetRecipesProvider).id;
  @override
  int get pageKey => (origin as GetRecipesProvider).pageKey;
  @override
  BuildContext get context => (origin as GetRecipesProvider).context;
}

String _$getVegRecipesHash() => r'262d6ac30dc0a18c52405ffd35a85a9137228eb0';

/// See also [getVegRecipes].
@ProviderFor(getVegRecipes)
const getVegRecipesProvider = GetVegRecipesFamily();

/// See also [getVegRecipes].
class GetVegRecipesFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getVegRecipes].
  const GetVegRecipesFamily();

  /// See also [getVegRecipes].
  GetVegRecipesProvider call({
    required int id,
    required int pageKey,
    required BuildContext context,
  }) {
    return GetVegRecipesProvider(
      id: id,
      pageKey: pageKey,
      context: context,
    );
  }

  @override
  GetVegRecipesProvider getProviderOverride(
    covariant GetVegRecipesProvider provider,
  ) {
    return call(
      id: provider.id,
      pageKey: provider.pageKey,
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
  String? get name => r'getVegRecipesProvider';
}

/// See also [getVegRecipes].
class GetVegRecipesProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getVegRecipes].
  GetVegRecipesProvider({
    required int id,
    required int pageKey,
    required BuildContext context,
  }) : this._internal(
          (ref) => getVegRecipes(
            ref as GetVegRecipesRef,
            id: id,
            pageKey: pageKey,
            context: context,
          ),
          from: getVegRecipesProvider,
          name: r'getVegRecipesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVegRecipesHash,
          dependencies: GetVegRecipesFamily._dependencies,
          allTransitiveDependencies:
              GetVegRecipesFamily._allTransitiveDependencies,
          id: id,
          pageKey: pageKey,
          context: context,
        );

  GetVegRecipesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.pageKey,
    required this.context,
  }) : super.internal();

  final int id;
  final int pageKey;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetVegRecipesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVegRecipesProvider._internal(
        (ref) => create(ref as GetVegRecipesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        pageKey: pageKey,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetVegRecipesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVegRecipesProvider &&
        other.id == id &&
        other.pageKey == pageKey &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, pageKey.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetVegRecipesRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `pageKey` of this provider.
  int get pageKey;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _GetVegRecipesProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetVegRecipesRef {
  _GetVegRecipesProviderElement(super.provider);

  @override
  int get id => (origin as GetVegRecipesProvider).id;
  @override
  int get pageKey => (origin as GetVegRecipesProvider).pageKey;
  @override
  BuildContext get context => (origin as GetVegRecipesProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
