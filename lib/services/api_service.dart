import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://localhost/project_php/api.php"; // Ganti dengan path file PHP kamu

  Future<Map<String, dynamic>> sendJsonRpc(String method, Map<String, dynamic> params) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "jsonrpc": "2.0",
        "method": method,
        "params": params,
        "id": 1
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.containsKey('error')) {
        throw Exception(data['error']['message']);
      }
      return data['result'];
    } else {
      throw Exception("Gagal menghubungi server");
    }
  }

  Future<List<dynamic>> getCurhatan() async {
    final result = await sendJsonRpc("get_curhatan", {});
    return result['curhatan'];
  }

  Future<String> addCurhatan(String judul, String isi) async {
    final result = await sendJsonRpc("add_curhatan", {
      "judul": judul,
      "isi": isi,
    });

    return result['status']; // "success" atau "error"
  }
}
