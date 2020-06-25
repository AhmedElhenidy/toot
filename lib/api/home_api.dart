import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:toot/model/gifts_model.dart';
import 'package:toot/model/monuments_model.dart';
import 'package:toot/model/museum_model.dart';
import 'dart:convert';

import 'package:toot/statics/data_constatnts.dart';


class HomeApiProvider{
  static void getHome(
      {
        void onSuccess(List<MuseumsModel> museums,List<MonumentsModel> monuments,List<GiftsModel> gifts,
            ),
        void onError()}) async {
    //API Calling
    http.Response response = await http.get("$BASE_URL$HOME_END_POINT",);
    // Decoding Response.
    var decoded = json.decode(response.body);
    // Debugging API response
    debugApi(
      methodName: "getHome",
      statusCode: response.statusCode,
      response: decoded,
      data: null,
      headers: null,
      endPoint: response.request.url,
    );
    //Response Handling
    if (isValidResponse(response.statusCode)) {
      List<MuseumsModel> museums = decoded['places'] == null ? [] : (decoded['places'] as List).map((e) => MuseumsModel.fromJson(e)).toList();
      List<MonumentsModel> monuments = decoded['Menuments'] == null ? [] : (decoded['Menuments'] as List).map((e) => MonumentsModel.fromJson(e)).toList();
      List<GiftsModel> gifts = decoded['gifts'] == null ? [] : (decoded['gifts'] as List).map((e) => GiftsModel.fromJson(e)).toList();
      onSuccess(museums,monuments,gifts);
    } else {
      onError();
    }
  }


}
