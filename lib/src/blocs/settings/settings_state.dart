part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final MeasurementUnits measurementUnits;

  const SettingsState({@required this.measurementUnits})
      : assert(measurementUnits != null);

  @override
  List<Object> get props => [measurementUnits];
}
