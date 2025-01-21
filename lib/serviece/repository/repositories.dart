import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_project/serviece/model/data_model.dart';

class DataRepository {
  String url = 'https://fakestoreapi.com/products?limit=10';
  
  Future<List<DataModel>> getData() async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map((e) => DataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
