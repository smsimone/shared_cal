// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendars_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Calendars)
const calendarsProvider = CalendarsFamily._();

final class CalendarsProvider
    extends $NotifierProvider<Calendars, List<CalendarConfig>> {
  const CalendarsProvider._({
    required CalendarsFamily super.from,
    required WidgetRef super.argument,
  }) : super(
         retry: null,
         name: r'calendarsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$calendarsHash();

  @override
  String toString() {
    return r'calendarsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Calendars create() => Calendars();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CalendarConfig> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CalendarConfig>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$calendarsHash() => r'2de9ba9e7447c20546de2cb2214c041ccc857401';

final class CalendarsFamily extends $Family
    with
        $ClassFamilyOverride<
          Calendars,
          List<CalendarConfig>,
          List<CalendarConfig>,
          List<CalendarConfig>,
          WidgetRef
        > {
  const CalendarsFamily._()
    : super(
        retry: null,
        name: r'calendarsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CalendarsProvider call(WidgetRef ref) =>
      CalendarsProvider._(argument: ref, from: this);

  @override
  String toString() => r'calendarsProvider';
}

abstract class _$Calendars extends $Notifier<List<CalendarConfig>> {
  late final _$args = ref.$arg as WidgetRef;
  WidgetRef get ref => _$args;

  List<CalendarConfig> build(WidgetRef ref);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<List<CalendarConfig>, List<CalendarConfig>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CalendarConfig>, List<CalendarConfig>>,
              List<CalendarConfig>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
