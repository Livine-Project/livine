// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

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

String $searchResultsHash() => r'344ced406dbb190ca2f98f5f65c8d40e2b4c756e';

/// See also [searchResults].
class SearchResultsProvider extends AutoDisposeFutureProvider<dynamic> {
  SearchResultsProvider({
    required this.pk,
    required this.query,
  }) : super(
          (ref) => searchResults(
            ref,
            pk: pk,
            query: query,
          ),
          from: searchResultsProvider,
          name: r'searchResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $searchResultsHash,
        );

  final int pk;
  final String query;

  @override
  bool operator ==(Object other) {
    return other is SearchResultsProvider &&
        other.pk == pk &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pk.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SearchResultsRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [searchResults].
final searchResultsProvider = SearchResultsFamily();

class SearchResultsFamily extends Family<AsyncValue<dynamic>> {
  SearchResultsFamily();

  SearchResultsProvider call({
    required int pk,
    required String query,
  }) {
    return SearchResultsProvider(
      pk: pk,
      query: query,
    );
  }

  @override
  AutoDisposeFutureProvider<dynamic> getProviderOverride(
    covariant SearchResultsProvider provider,
  ) {
    return call(
      pk: provider.pk,
      query: provider.query,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'searchResultsProvider';
}
