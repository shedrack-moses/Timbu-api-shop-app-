import 'dart:convert';
import 'package:flutter_footwear_app/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String fullUrl;
  late final String baseUrl;

  ApiService(this.fullUrl) {
    baseUrl = getBaseUrl(fullUrl);
    print('Base URL: $baseUrl'); // Debug log for base URL
  }

  String getBaseUrl(String url) {
    Uri uri = Uri.parse(url);
    return '${uri.scheme}://${uri.host}/images/';
  }

  Future<Product?> fetchData() async {
    try {
      print('Fetching data from: $fullUrl'); // Debug log for full URL
      final response = await http.get(Uri.parse(fullUrl));

      if (response.statusCode == 200) {
        print('Response received: ${response.body}'); // Log the response body
        final decodedJson = jsonDecode(response.body);
        print('Decoded JSON: $decodedJson'); // Log the decoded JSON
        if (decodedJson is Map<String, dynamic>) {
          return Product.fromJson(decodedJson);
        } else {
          print(
              'Error: Expected a Map<String, dynamic> but got ${decodedJson.runtimeType}');
          return null;
        }
      } else {
        print(
            'Error: Failed to load data with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception caught: $e'); // Detailed exception logging
      return null;
    }
  }
}
