import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class ApiService {

  final String all_algorithem="https://algorithmvisualization.000webhostapp.com/Project/API/All_Algorithms.php";
  final String mostview="https://algorithmvisualization.000webhostapp.com/Project/API/MostView.php";
  final String type="https://algorithmvisualization.000webhostapp.com/Project/API/Type.php";
  final String dfs="https://algorithmvisualization.000webhostapp.com/Project/API/DFS.php";
  final String recentview="https://algorithmvisualization.000webhostapp.com/Project/API/RecentView.php";
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse(all_algorithem));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
  Future<List<Map<String, dynamic>>> all_type() async{
    final response=await http.get(Uri.parse(type));

    if (response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    }else{
      throw Exception('failed to fetch data');
    }
  }
  Future<List<Map<String, dynamic>>> DFSData() async {
    final response = await http.get(Uri.parse(dfs));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('failed to fetch data');
    }
  }
    Future<List<Map<String, dynamic>>> recent() async{
      final response=await http.get(Uri.parse(recentview));

      if (response.statusCode == 200){
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      }else{
        throw Exception('failed to fetch data');
      }
  }
}
