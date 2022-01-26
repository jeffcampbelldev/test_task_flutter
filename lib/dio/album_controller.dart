import 'package:dio/dio.dart';

class AlbumController{

  Future<Response<dynamic>> getAlbums() async{
    try{
      var response = await Dio().get("https://itunes.apple.com/lookup?id=909253&entity=album");
      return response;
    }catch(e){
      rethrow;
    }
  }
}