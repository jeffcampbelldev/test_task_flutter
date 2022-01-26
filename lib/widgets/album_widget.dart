import 'package:challenge/models/album_model.dart';
import 'package:challenge/providers/albums_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AlbumWidget extends StatelessWidget {
  AlbumModel model;
  AlbumWidget(this.model, {Key? key}) : super(key: key);

  // "releaseDate":"2012-01-01T08:00:00Z",
  var availableFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
  var requiredFormat = DateFormat("MMMM dd, yyyy");
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    DateTime releasedDate = availableFormat.parse(model.releaseDate!);
    return Consumer<AlbumsProvider>(
      builder: (context, value, child) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.015),
            child: Row(
              children: [
                FadeInImage(
                  placeholder: const AssetImage("assets/images/placeholder.jpg"),
                  image: NetworkImage(model.image!),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.015,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.albumName ?? "",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: height * 0.005,),
                        Text("${model.price ?? 0 } ${model.currency ?? ""}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: height * 0.005,),

                        Text(requiredFormat.format(releasedDate),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                IconButton(
                  onPressed: (){
                    value.setFavourite(model.collectionId!);
                  },
                  icon: Icon(Icons.favorite,
                    color: value.favorites.contains(model.collectionId) ? Colors.red : Colors.grey,
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
