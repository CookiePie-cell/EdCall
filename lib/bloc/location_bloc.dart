import 'package:ed_call/bloc/location_event.dart';
import 'package:ed_call/bloc/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  late bool serviceEnabled;
  late LocationPermission permission;
  late Position _position;
  LocationBloc() : super(InitialLocation()) {
    on<LoadCurrentLocation>(_determinePosition);
  }

  void _determinePosition(
      LoadCurrentLocation event, Emitter<LocationState> emit) async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(LocationNotLoaded());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        emit(LocationNotLoaded());
      }
    }
    if (permission == LocationPermission.deniedForever) {
      emit(LocationNotLoaded());
    }
    _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    emit(LocationLoaded(await convertToAddress(_position)));
  }

  Future<String> convertToAddress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String address =
        '${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].country}';
    return address;
  }
}
