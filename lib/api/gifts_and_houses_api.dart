import 'package:http/http.dart' as http;
import 'package:toot/model/house_model.dart';
import 'dart:convert';
import 'package:toot/statics/data_constatnts.dart';

class GiftsAndHousesApiProvider{
  static void getHouses(
      {
        void onSuccess(List<HousesModel> houses),
        void onError()}) async {
    //API Calling
    http.Response response = await http.get("$BASE_URL$HOUSES_END_POINT",);
    // Decoding Response.
    var decoded = json.decode(response.body);
    // Debugging API response
    debugApi(
      methodName: "getHouses",
      statusCode: response.statusCode,
      response: decoded,
      data: null,
      headers: null,
      endPoint: response.request.url,
    );
    //Response Handling
    if (isValidResponse(response.statusCode)) {
      List<HousesModel> houses = decoded == null ? [] : (decoded as List).map((e) => HousesModel.fromJson(e)).toList();
      onSuccess(houses);
    } else {
      onError();
    }
  }


}
