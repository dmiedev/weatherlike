part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class MeasurementUnitsSelected extends SettingsEvent {
  final MeasurementUnits measurementUnits;

  const MeasurementUnitsSelected({@required this.measurementUnits})
      : assert(measurementUnits != null);

  @override
  List<Object> get props => [measurementUnits];
}
