//BASE URL declaration
import 'package:flutter/cupertino.dart';

const String BASE_URL = 'http://egymuseums.somee.com/' ;

//Static Headers
const Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};

// file Path : api\auth_apis.dart end_points
const String HOME_END_POINT = "rpc/ApiPlaces/GetHome";
const String HOUSES_END_POINT = "rpc/ApiHouses/Gethouses";
const String GET_MONUMENT_BY_ID_END_POINT = "rpc/ApiMenuments/Getmenument/";







////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// Helpers Functions /////////////////////////////
 bool isValidResponse(int statusCode) {
return statusCode >= 200 && statusCode <= 302;
}

 void debugApi(
{String fileName = "ApiProvider.dart",
@required String methodName,
@required int statusCode,
@required response,
@required data,
@required endPoint,
headers}) {
debugPrint(
"FileName: $fileName\n"
"Method: $methodName\n"
"${endPoint != null ? 'EndPoint: $endPoint\n' : ''}"
"${data != null ? 'Sent with data: $data\n' : ''}"
"${headers != null ? "sent with Headerss :$headers" : ""}"
"Returned with statusCode: $statusCode\n"
"${response != null ? 'Returned with Response: $response\n' : ''}"
"--------------------",
wrapWidth: 512,
);
}