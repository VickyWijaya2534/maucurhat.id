import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://localhost/project_php/get_curhatan.php";
  final String addCurhatUrl = "http://localhost/project_php/add_curhatan.php";


  Future<List<dynamic>> getCurhatan() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal mengambil data dari server");
    }
  }
}
