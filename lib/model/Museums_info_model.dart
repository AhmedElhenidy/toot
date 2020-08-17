import 'package:toot/statics/data_constatnts.dart';

class MuseumsInfoModel {
    List<Catogegory> catogegories;
    String governorate;
    int id;
    List<Image2> images;
    double lattitude;
    double longitude;
    String map;
    List<Monument> monuments;
    String name;
    MuseumsInfoModel({this.catogegories, this.governorate, this.id, this.images, this.lattitude, this.longitude, this.map, this.monuments, this.name});

    factory MuseumsInfoModel.fromJson(Map<String, dynamic> json) {
        return MuseumsInfoModel(
            catogegories: json['catogegories'] != null ? (json['catogegories'] as List).map((i) => Catogegory.fromJson(i)).toList() : null,
            governorate: json['governorate'],
            id: json['id'],
            images: json['Images'] != null ? (json['Images'] as List).map((i) => Image2.fromJson(i)).toList() : null,
            lattitude: json['lattitude'],
            longitude: json['longitude'],
            map: json['map']!=null? "$BASE_URL2${json['map'].toString().substring(1)}":"",
            monuments: json['monuments'] != null ? (json['monuments'] as List).map((i) => Monument.fromJson(i)).toList() : null,
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['governorate'] = this.governorate;
        data['id'] = this.id;
        data['lattitude'] = this.lattitude;
        data['longitude'] = this.longitude;
        data['map'] = this.map;
        data['name'] = this.name;
        if (this.catogegories != null) {
            data['catogegories'] = this.catogegories.map((v) => v.toJson()).toList();
        }
        if (this.images != null) {
            data['images'] = this.images.map((v) => v.toJson()).toList();
        }
        if (this.monuments != null) {
            data['monuments'] = this.monuments.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Catogegory {
    int cat_id;
    String name;
    Catogegory({this.cat_id, this.name});
    factory Catogegory.fromJson(Map<String, dynamic> json) {
        return Catogegory(
            cat_id: json['cat_id'],
            name: json['name'],
        );
    }
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cat_id'] = this.cat_id;
        data['name'] = this.name;
        return data;
    }
}

class Monument {
    int id;
    String image;
    String name;

    Monument({this.id, this.image, this.name});

    factory Monument.fromJson(Map<String, dynamic> json) {
        return Monument(
            id: json['id'],
            image: json['image'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['image'] = this.image;
        data['name'] = this.name;
        return data;
    }
}

class Image2 {
    String altr;
    int id;
    String image;

    Image2({this.altr, this.id, this.image});

    factory Image2.fromJson(Map<String, dynamic> json) {
        return Image2(
            altr: json['altr'],
            id: json['id'],
            image: json['image']!=null? "$BASE_URL2${json['image'].toString().substring(1)}":"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['altr'] = this.altr;
        data['id'] = this.id;
        data['image'] = this.image;
        return data;
    }
}