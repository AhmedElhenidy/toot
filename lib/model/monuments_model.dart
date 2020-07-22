import 'package:toot/model/image_model.dart';
import 'package:toot/statics/data_constatnts.dart';
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
            image:json['image']!=null? "$BASE_URL${json['image'].toString().substring(1)}":"",
            menument_id: json['menument_id'],
        );
    }
}

class MonumentModel {
    String description;
    int id;
    List<MonumentImage> menument_images;
    String name;
    int no_of_scans;
    int place_id;
    String place_name;
    String qR_image;
    String voice_note;

    MonumentModel({this.description, this.id, this.menument_images, this.name, this.no_of_scans, this.place_id, this.place_name, this.qR_image, this.voice_note});

    factory MonumentModel.fromJson(Map<String, dynamic> json) {
        return MonumentModel(
            description: json['description'],
            id: json['id'],
            menument_images: json['menument_images'] != null ? (json['menument_images'] as List).map((i) => MonumentImage.fromJson(i)).toList() : null,
            name: json['name'],
            no_of_scans: json['no_of_scans'],
            place_id: json['place_id'],
            place_name: json['place_name'],
            qR_image: json['qR_image'],
            voice_note: json['voice_note']!=null?"$BASE_URL${json['voice_note'].toString().substring(1)}":"",
        );
    }
}