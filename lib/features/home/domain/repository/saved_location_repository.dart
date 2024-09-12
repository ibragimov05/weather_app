import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/core.dart';
import 'package:weather_app/features/home/data/models/saved_location/saved_location_response.dart';

import '../../../../injector_container.dart';

part '../../data/repository/saved_location_repository_impl.dart';

sealed class SavedLocationRepository {
  Future<Either<Failure, SavedLocationResponse>> getSavedLocations();

  Future<Either<Failure, bool>> addNewLocation({required String name});

  Future<Either<Failure, bool>> delete({required String name});
}
