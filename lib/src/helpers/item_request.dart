import 'dart:convert';

import 'package:aguchi_prueba1/src/helpers/base_request.dart';
import 'package:aguchi_prueba1/src/models/item.dart';
import 'package:http/http.dart' as http;

class RequestItem implements HTTPRequest<Item> {
  final String url;
  const RequestItem({required this.url});

  Future<Item> execute() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw http.ClientException('Error con los datos');
    }
    return _parseJSON(response.body);
  }

  Item _parseJSON(String response) {
    return Item.fromJson(jsonDecode(response));
  }
}
