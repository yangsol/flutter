import 'dart:convert';

import 'package:flutter_attr_busan/attr_dto.dart';
import 'package:http/http.dart' as http;

class AttrRepository{
  static Future<List<AttrDTO>?> getDTO() async{
    final String url = "https://apis.data.go.kr/6260000/AttractionService/getAttractionKr?serviceKey=pN897FPbjFOsHsh0hDJGwYr4fYwiE%2F0%2F0ae8NCKmuiLKyBD6Tt5U5omyss2fpOZMhQZmNc1Q4BtyMNvOHmiZ9A%3D%3D&pageNo=1&numOfRows=10&resultType=JSON";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      dynamic json = jsonDecode(response.body);

      return AttrDTO.fromJsonList(json["getAttractionKr"]["item"]);
    }else{
      return null;
    }
  }
}