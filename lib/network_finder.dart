import 'package:http/http.dart' as http;

class NetworkReader {
  Future<String> read(Uri uri) async {
    String editLink = "https://en.wikipedia.org/w/api.php?action=query&format=json&"
        "prop=revisions&titles=Joe_Biden&rvprop=timestamp|user&rvlimit=4&redirects";
    String result = editLink.replaceAll("Soup", "_controller");
    final response = await http.get(Uri.parse(result));
    return response.body;
  }
}
