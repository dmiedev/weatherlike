part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class MeasurementUnitsSelected extends SettingsEvent {
  const MeasurementUnitsSelected({@required this.measurementUnits})
      : assert(measurementUnits != null);

  final MeasurementUnits measurementUnits;

  @override
  List<Object> get props => [measurementUnits];
}
