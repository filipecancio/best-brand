import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:developer';

class BBRepository {

  final List<String> _productList = ["tenis","bone","camisa","oculos","calca"];

  Future<dynamic> readJson() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/lib/assets/feed.json');
    final String response = await file.readAsString();
    final data = await json.decode(response);
    log('data: hello ');
    return data;
  }

  List<String> getAllProducts(){
    return _productList;
  }

}