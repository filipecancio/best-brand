
import 'dart:convert';
import 'dart:io';

Future<Stream<String>> getUrl(url) async {
  final request = await HttpClient().getUrl(url);
  final response = await request.close();

  return response.transform(const Utf8Decoder());
}
