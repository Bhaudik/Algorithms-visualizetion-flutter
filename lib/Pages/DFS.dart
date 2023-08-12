import 'package:flutter/material.dart';
import '../ApiServices/api_service.dart';

class DFS extends StatefulWidget {
  const DFS({super.key});

  @override
  State<DFS> createState() => _DFSState();
}

class _DFSState extends State<DFS> {
  ApiService DFS = ApiService();
  late Future<List<Map<String, dynamic>>> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = DFS.DFSData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DFS'),
      ),
      body: Container(
        child: FutureBuilder<List<Map<String , dynamic>>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];

                  return Container(
                    child: ListTile(
                      title: Text(item['ID']),
                      subtitle: Text(item['NAME']),
                      //leading: Image.network(item['IMAGE']),
                      trailing: Text(item['TYPE']),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
