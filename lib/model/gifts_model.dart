import 'package:toot/statics/data_constatnts.dart';

class GiftsModel {
    int id;
    String name;
    String photo;

    GiftsModel({this.id, this.name, this.photo});

    factory GiftsModel.fromJson(Map<String, dynamic> json) {
        return GiftsModel(
            id: json['id']!= null ?json['id'] : 0,
            name: json['name']!= null ?json['name'] : "",
            photo: json['photo']!= null ?"$BASE_URL${json['photo'].toString().substring(1)}" : "",
        );
    }
}