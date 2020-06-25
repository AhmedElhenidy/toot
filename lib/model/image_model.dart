import 'package:toot/statics/data_constatnts.dart';

class ImageModel {
  String altr;
  int id;
  String image;

  ImageModel({this.altr, this.id, this.image});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      altr: json['altr']!= null ?json['altr'] : "",
      id: json['id']!= null ?json['id'] : 0,
      image: json['image']!= null ?BASE_URL+json['image'].toString().substring(2) : "",
    );
  }
}