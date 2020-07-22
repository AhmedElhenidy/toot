import 'package:toot/statics/data_constatnts.dart';

class HousesModel {
    String description;
    String governorate;
    int id;
    String name;
    String photo;
    String relatedWith;

    HousesModel({this.description, this.governorate, this.id, this.name, this.photo, this.relatedWith});

    factory HousesModel.fromJson(Map<String, dynamic> json) {
        return HousesModel(
            description: json['description'],
            governorate: json['governorate'],
            id: json['id'],
            name: json['name'],
            photo: json['photo']!=null?"$BASE_URL${json['photo'].toString().substring(1)}":"",
            relatedWith: json['relatedWith'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['governorate'] = this.governorate;
        data['id'] = this.id;
        data['name'] = this.name;
        data['photo'] = this.photo;
        data['relatedWith'] = this.relatedWith;
        return data;
    }
}