import 'package:http/http.dart' as http;

class Request {
  late final String url;
  late final dynamic body;

  Request({required this.url, this.body});

  Future<http.Response> get() async {
    return await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=utf-8',
    }).timeout(Duration(minutes: 2));
  }

  Future<http.Response> post() async {
    return await http.post(Uri.parse(url), body: body, headers: {
      'Content-Type': 'application/json; charset=utf-8',
    }).timeout(Duration(minutes: 2));
  }

  Future<http.Response> patch() {
    return http.patch(Uri.parse(url), body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> delete() {
    return http
        .delete(Uri.parse(url), body: body)
        .timeout(Duration(minutes: 2));
  }
}
