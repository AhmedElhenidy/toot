import 'package:http/http.dart' as http;
import 'package:toot/model/Museums_info_model.dart';
import 'package:toot/model/house_model.dart';
import 'dart:convert';
import 'package:toot/statics/data_constatnts.dart';

class GetMuseumInfoApiProvider{
  static void getMuseum(
      {int id,
        void onSuccess(MuseumsInfoModel museum),
        void onError()}) async {
    //API Calling
    http.Response response = await http.get("$BASE_URL$GET_MUSEUM_INFO_END_POINT$id",);
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
      MuseumsInfoModel museum =MuseumsInfoModel.fromJson(decoded);
      onSuccess(museum);
    } else {
      onError();
    }
  }


}
