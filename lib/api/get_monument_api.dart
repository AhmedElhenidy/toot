import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toot/model/monument.dart';
import 'package:toot/model/gifts_model.dart';
import 'package:toot/model/monuments_model.dart';
import 'package:toot/model/museum_model.dart';
import 'package:toot/statics/data_constatnts.dart';
class GetMonumentApi{
  Future<MonumentModel2> getMonument(String name) async{
    final url = "http://www.egymuseums.somee.com/api/qrcode?name=$name" ;
    print(url);
    final response = await http.get(url);
    print(response.body);
    Map<String , dynamic> jsonResponse = json.decode(response.body);
    //print("res "+jsonResponse);
    return  MonumentModel2.fromJson(jsonResponse);
  }
}

class GetMonumentApiProvider{
  static void getMonumentByID(
      {int id,
        void onSuccess(MonumentModel2 monument,
            ),
        void onError()}) async {
    //API Calling
    http.Response response = await http.get("$BASE_URL$GET_MONUMENT_BY_ID_END_POINT$id",);
    // Decoding Response.
    var decoded = json.decode(response.body);
    // Debugging API response
    debugApi(
      methodName: "get Monument By ID",
      statusCode: response.statusCode,
      response: decoded,
      data: null,
      headers: null,
      endPoint: response.request.url,
    );
    //Response Handling
    if (isValidResponse(response.statusCode)) {
      MonumentModel2 monument = MonumentModel2.fromJson(decoded);
      onSuccess(monument);
    } else {
      onError();
    }
  }


}
