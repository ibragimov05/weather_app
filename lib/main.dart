import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/utils/utils.dart';
import 'injector_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// adding bloc observer
  if (kDebugMode) Bloc.observer = const AppBlocObserver();

  /// initiliazing dotenv
  await dotenv.load(fileName: '.env');

  /// dependency injection
  di.init();

  /// hydrated bloc to store last state of bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(const App());
}
