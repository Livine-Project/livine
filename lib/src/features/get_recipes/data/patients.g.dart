// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPatientsHash() => r'193cdeebf7ebd0b814439a567599490c7345ec0d';

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

/// See also [getPatients].
@ProviderFor(getPatients)
const getPatientsProvider = GetPatientsFamily();

/// See also [getPatients].
class GetPatientsFamily extends Family<AsyncValue<List<Patients>>> {
  /// See also [getPatients].
  const GetPatientsFamily();

  /// See also [getPatients].
  GetPatientsProvider call({
    required BuildContext context,
  }) {
    return GetPatientsProvider(
      context: context,
    );
  }

  @override
  GetPatientsProvider getProviderOverride(
    covariant GetPatientsProvider provider,
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
  String? get name => r'getPatientsProvider';
}

/// See also [getPatients].
class GetPatientsProvider extends AutoDisposeFutureProvider<List<Patients>> {
  /// See also [getPatients].
  GetPatientsProvider({
    required BuildContext context,
  }) : this._internal(
          (ref) => getPatients(
            ref as GetPatientsRef,
            context: context,
          ),
          from: getPatientsProvider,
          name: r'getPatientsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPatientsHash,
          dependencies: GetPatientsFamily._dependencies,
          allTransitiveDependencies:
              GetPatientsFamily._allTransitiveDependencies,
          context: context,
        );

  GetPatientsProvider._internal(
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
    FutureOr<List<Patients>> Function(GetPatientsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPatientsProvider._internal(
        (ref) => create(ref as GetPatientsRef),
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
  AutoDisposeFutureProviderElement<List<Patients>> createElement() {
    return _GetPatientsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPatientsProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPatientsRef on AutoDisposeFutureProviderRef<List<Patients>> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _GetPatientsProviderElement
    extends AutoDisposeFutureProviderElement<List<Patients>>
    with GetPatientsRef {
  _GetPatientsProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetPatientsProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
