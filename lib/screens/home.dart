
import 'package:challenge/enums/states.dart';
import 'package:challenge/providers/albums_provider.dart';
import 'package:challenge/widgets/album_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  late double width, height;
  late AlbumsProvider model;
  @override
  Widget build(BuildContext context) {

    //sccreen width, height
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    return Consumer<AlbumsProvider>(
      builder: (context, value, child) {
        model = value;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Albums",),
            actions: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: width * 0.03,),
                child: Text("Favourites: ${model.favorites.length}",),
              ),
            ],
          ),
          body: mainWidget(),
        );
      }
    );
  }
  Widget mainWidget(){
    if(model.state == connectionState.waiting){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else if(model.state == connectionState.error){
      return const Center(
        child: Text("Something went wrong"),
      );
    }else{
      if(model.list.isEmpty){
        return const Center(
          child: Text("No records found"),
        );
      }else{
        return ListView.builder(
          itemBuilder: (ctx,i){
            return AlbumWidget(model.list[i]);
          },
          itemCount: model.list.length,
        );
      }
    }
  }
}
