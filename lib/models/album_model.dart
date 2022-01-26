// For each album include the following: album name, image, price, release date.
class AlbumModel{
  String? albumName, image, releaseDate, currency;
  double? price;

  int? collectionId;

  AlbumModel();

  AlbumModel.fromJson(Map<String, dynamic> data){
    collectionId = data["collectionId"];
    albumName = data["collectionName"];
    image = data["artworkUrl100"];

    // "releaseDate":"2012-01-01T08:00:00Z",
    releaseDate = data["releaseDate"];
    currency = data["currency"];
    price = data["collectionPrice"];
  }



}