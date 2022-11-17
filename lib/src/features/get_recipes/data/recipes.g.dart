// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $getRecipesHash() => r'90f07d1abe4044a71c4a09065c8f9d33df8d9f40';

/// See also [getRecipes].
class GetRecipesProvider extends AutoDisposeFutureProvider<dynamic> {
  GetRecipesProvider({
    required this.id,
    required this.pageKey,
  }) : super(
          (ref) => getRecipes(
            ref,
            id: id,
            pageKey: pageKey,
          ),
          from: getRecipesProvider,
          name: r'getRecipesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $getRecipesHash,
        );

  final int id;
  final int pageKey;

  @override
  bool operator ==(Object other) {
    return other is GetRecipesProvider &&
        other.id == id &&
        other.pageKey == pageKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, pageKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetRecipesRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [getRecipes].
final getRecipesProvider = GetRecipesFamily();

class GetRecipesFamily extends Family<AsyncValue<dynamic>> {
  GetRecipesFamily();

  GetRecipesProvider call({
    required int id,
    required int pageKey,
  }) {
    return GetRecipesProvider(
      id: id,
      pageKey: pageKey,
    );
  }

  @override
  AutoDisposeFutureProvider<dynamic> getProviderOverride(
    covariant GetRecipesProvider provider,
  ) {
    return call(
      id: provider.id,
      pageKey: provider.pageKey,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getRecipesProvider';
}

String $getVegRecipesHash() => r'84718619964ac5f5ff46ec1893252b7c7ef0c21b';

/// See also [getVegRecipes].
class GetVegRecipesProvider extends AutoDisposeFutureProvider<dynamic> {
  GetVegRecipesProvider({
    required this.id,
    required this.pageKey,
  }) : super(
          (ref) => getVegRecipes(
            ref,
            id: id,
            pageKey: pageKey,
          ),
          from: getVegRecipesProvider,
          name: r'getVegRecipesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $getVegRecipesHash,
        );

  final int id;
  final int pageKey;

  @override
  bool operator ==(Object other) {
    return other is GetVegRecipesProvider &&
        other.id == id &&
        other.pageKey == pageKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, pageKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetVegRecipesRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [getVegRecipes].
final getVegRecipesProvider = GetVegRecipesFamily();

class GetVegRecipesFamily extends Family<AsyncValue<dynamic>> {
  GetVegRecipesFamily();

  GetVegRecipesProvider call({
    required int id,
    required int pageKey,
  }) {
    return GetVegRecipesProvider(
      id: id,
      pageKey: pageKey,
    );
  }

  @override
  AutoDisposeFutureProvider<dynamic> getProviderOverride(
    covariant GetVegRecipesProvider provider,
  ) {
    return call(
      id: provider.id,
      pageKey: provider.pageKey,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getVegRecipesProvider';
}
