import 'dart:convert';

import 'package:challenge/dio/album_controller.dart';
import 'package:challenge/enums/states.dart';
import 'package:challenge/enums/states.dart';
import 'package:challenge/models/album_model.dart';
import 'package:challenge/others/locator.dart';
import 'package:flutter/cupertino.dart';

class AlbumsProvider with ChangeNotifier{

  //data variables
  connectionState state = connectionState.waiting;
  List<AlbumModel> list = [];
  List<int> favorites = [];


  //constructor
  AlbumsProvider(){

    // getting album data from url.
    locator.get<AlbumController>().getAlbums().then((response){
      var results = jsonDecode(response.data)["results"];
      for(var result in results){
        if(result["wrapperType"] == "collection"){
          var model = AlbumModel.fromJson(result);
          list.add(model);
        }
      }
      state = connectionState.success;
      notifyListeners();
    }).catchError((error){
      state = connectionState.error;
      print(error);
    });
  }


  //adding or removing favourites
  setFavourite(int val){
    if(favorites.contains(val)){
      favorites.remove(val);
    }else{
      favorites.add(val);
    }
    notifyListeners();
  }

}