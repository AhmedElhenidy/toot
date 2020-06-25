import 'package:toot/model/image_model.dart';

class MuseumsModel {
    String governorate;
    int id;
    List<ImageModel> images;
    String name;

    MuseumsModel({this.governorate, this.id, this.images, this.name});

    factory MuseumsModel.fromJson(Map<String, dynamic> json) {
        return MuseumsModel(
            governorate: json['governorate'] != null ?json['governorate'] : "",
            id: json['id']!= null ?json['id'] : 0,
            images: json['Images'] != null ? (json['Images'] as List).map((i) => ImageModel.fromJson(i)).toList() : [],
            name: json['name']!= null ?json['name'] : "",
        );
    }
}

