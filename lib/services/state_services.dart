import 'dart:convert';
import 'package:covid19_api_project/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/world_state.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesAPI));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error Occurred');
    }
  }

  Future<List<dynamic>> countriesList() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
