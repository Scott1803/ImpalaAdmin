import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ImpalaAdmin/Models/Place.dart';
import 'package:ImpalaAdmin/services/ConversionService.dart';

class ApiService {
  Future<List<Place>> createPlaces(
      {double latSouth,
      double lonWest,
      double latNorth,
      double lonEast}) async {
    String url =
        "http://projectnextdevwebapp.azurewebsites.net/api/create?latSouth=$latSouth&lonWest=$lonWest&latNorth=$latNorth&lonEast=$lonEast";

    var response = await http.get(url);
    List<Place> list;
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      list = ConversionService.mapListToPlaces(responseMap);
      return list;
    }
  }
}
