import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toot/model/monument.dart';
class GetMonumentApi{
  Future<GetMonumentServerResponse> getMonument(String name) async{
    final url = "http://www.egymuseums.somee.com/api/qrcode?name=$name" ;
    print(url);
    final response = await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return  GetMonumentServerResponse.fromJson(jsonResponse);
  }
}