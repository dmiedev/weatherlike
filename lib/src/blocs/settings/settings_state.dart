part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({@required this.measurementUnits})
      : assert(measurementUnits != null);

  final MeasurementUnits measurementUnits;

  @override
  List<Object> get props => [measurementUnits];
}
