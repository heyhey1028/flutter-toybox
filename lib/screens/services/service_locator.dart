import 'package:flutter_toybox/screens/background_play/audio_handler.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  getIt.registerSingleton<AudioServiceHandler>(await initeAudioService());
}
