import 'package:toot/model/image_model.dart';

class MonumentsModel {
    int id;
    List<ImageModel> images;
    String mainPlace;
    String name;

    MonumentsModel({this.id, this.images, this.mainPlace, this.name});

    factory MonumentsModel.fromJson(Map<String, dynamic> json) {
        return MonumentsModel(
            id: json['id']!= null ?json['id'] : 0,
            images: json['Images'] != null ? (json['Images'] as List).map((i) => ImageModel.fromJson(i)).toList() : [],
            mainPlace: json['mainPlace']!= null ?json['mainPlace'] : "",
            name: json['name']!= null ?json['name'] : "",
        );
    }
}