part of '../../domain/repository/saved_location_repository.dart';

class SavedLocationRepositoryImpl extends SavedLocationRepository {
  static final SharedPreferences _prefs = getIt.get<SharedPreferences>();
  static const String _key = '__saved_location__';

  @override
  Future<Either<Failure, SavedLocationResponse>> getSavedLocations() async {
    try {
      final locations = _prefs.getStringList(_key) ?? [];

      return Right<Failure, SavedLocationResponse>(
        SavedLocationResponse(locations: locations),
      );
    } catch (e) {
      return Left<Failure, SavedLocationResponse>(
        StorageFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addNewLocation({required String name}) async {
    try {
      final savedLocations = _prefs.getStringList(_key) ?? [];

      savedLocations.add(name);
      _prefs.setStringList(_key, savedLocations);

      return const Right<Failure, bool>(true);
    } catch (e) {
      return Left<Failure, bool>(StorageFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> delete({required String name}) async {
    try {
      final savedLocations = _prefs.getStringList(_key) ?? [];

      final int index = savedLocations.indexWhere((element) => element == name);

      if (index != -1) {
        savedLocations.removeAt(index);
      }

      return const Right<Failure, bool>(true);
    } catch (e) {
      return Left<Failure, bool>(StorageFailure(message: e.toString()));
    }
  }
}
