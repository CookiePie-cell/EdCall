import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class InitialLocation extends LocationState {
  const InitialLocation();
}

class LocationLoaded extends LocationState {
  final String address;
  const LocationLoaded(this.address);
}

class LocationLoading extends LocationState {
  const LocationLoading();
}

class LocationNotLoaded extends LocationState {
  const LocationNotLoaded();
}
