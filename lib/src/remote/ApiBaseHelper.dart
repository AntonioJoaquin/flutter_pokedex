import 'dart:io';

import 'package:http/http.dart' as http;

class ApiBaseHelper {

  final String _baseUrl = 'https://pokeapi.co/api/v2/';


  Future<dynamic> get(String url) async {
    var responseJson;

    try {
      final response = await http
    } on SocketException {
      print('Connection error');
    }

    return responseJson;
  }

}