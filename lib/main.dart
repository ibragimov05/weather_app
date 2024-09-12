import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/utils/utils.dart';
import 'injector_container.dart';
import 'services/location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// adding bloc observer
  if (kDebugMode) Bloc.observer = const AppBlocObserver();

  /// dependency injection
  slInit();

  /// hydrated bloc to store last state of bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  /// check location permission
  await LocationService.checkPermissions();

  runApp(const App());
}
