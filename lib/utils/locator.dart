import 'package:get_it/get_it.dart';
import 'package:youtube_music_clone/handlers/handlers.dart';

GetIt locator = GetIt.instance;

///Registers dependencies
Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationHandler());
}
