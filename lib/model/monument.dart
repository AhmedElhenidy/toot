class MonumentImage {
    String altr;
    int id;
    String image;
    int menument_id;
    MonumentImage({this.altr, this.id, this.image, this.menument_id});
    factory MonumentImage.fromJson(Map<String, dynamic> json) {
        return MonumentImage(
            altr: json['altr'],
            id: json['id'],
            image: json['image'],
            menument_id: json['menument_id'],
        );
    }
}
class GetMonumentServerResponse{
    String description;
    int id;
    String name;
    int no_of_scans;
    int place_id;
    String place_name;
    String qR_image;
    String voice_note;
    List<MonumentImage> monumentImage ;
  GetMonumentServerResponse({this.monumentImage,this.description, this.id,
       this.name, this.no_of_scans, this.place_id,
      this.place_name, this.qR_image, this.voice_note});
  factory GetMonumentServerResponse.fromJson(Map<String ,dynamic> json ){
      List<dynamic> jsonMonumentImage = json['menument_images'] as List ;
    return new GetMonumentServerResponse(
        monumentImage: jsonMonumentImage == null ? [] : jsonMonumentImage.map((jsonProduct)=>MonumentImage.fromJson(jsonProduct)).toList(),
        id: json['id'],
        name: json['name'],
        description: json['description'],
        voice_note: json['voice_note'],
        qR_image: json['QR_image'],
        no_of_scans: json['no_of_scans'],
        place_id: json['place_id'],
        place_name: json['place_name']
    );
  }
}