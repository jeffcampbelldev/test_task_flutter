import 'package:challenge/dio/album_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

void setupLocator(){
  //setting up singleton
  locator.registerLazySingleton<AlbumController>(() => AlbumController());
}