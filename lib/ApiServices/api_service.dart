import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class ApiService {
  final String allalgo = "https://algorithmvisualization.000webhostapp.com/Project/API/All_Algorithms.php"; // Replace with your API URL
  final String DFS="https://algorithmvisualization.000webhostapp.com/Project/API/DFS.php";
  final String OS="https://algorithmvisualization.000webhostapp.com/Project/API/DFS.php";
  final String type="https://algorithmvisualization.000webhostapp.com/Project/API/Type.php";
  final String user="https://algorithmvisualization.000webhostapp.com/Project/API/DFS.php";
  final String Mostview="https://algorithmvisualization.000webhostapp.com/Project/API/DFS.php";
  final String Insertuser="https://algorithmvisualization.000webhostapp.com/Project/API/DFS.php";
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse(allalgo));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
  Future<List<Map<String, dynamic>>> DFSData() async{
    final response=await http.get(Uri.parse(type));

    if (response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    }else{
      throw Exception('failed to fetch data');
    }
  }
}
