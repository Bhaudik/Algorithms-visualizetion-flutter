import 'dart:ui';
import '../ApiServices/api_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Sign_in_Sign_up/login.dart';
import 'ground.dart';
class detail extends StatefulWidget {
  const detail({super.key, required this.title});
  final String title;


  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {


  ApiService fatchtype=ApiService();
  late Future<List<Map<String, dynamic>>> mostView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mostView=fatchtype.fetchData();

  }
  final Box _boxLogin = Hive.box("login");
  var data=['All','Sorting','Searching','LinkedList','Tree','Sheduling'];
  var img=['assets/DFS/Sorting/BubbleSort.png','assets/DFS/LinkList/CLL.png','assets/DFS/LinkList/DLL.png','assets/DFS/LinkList/SLL.png','assets/DFS/Searching/LinearSearch.png','assets/DFS/Searching/BinarySearch.png'];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.width;
    final w = MediaQuery.of(context).size.height;
    final x = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

        leading: Image.asset("assets/Images/icon.png"),
        title: Row(
          children: [
            Text("Deatails Lerning",style: TextStyle(color: Color(0xF5623813),fontSize: 30,fontWeight: FontWeight.bold),),
          ],
        ),
        //Text(Image.asset("assets/Images/name.png")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: IconButton(
                color: Colors.black,
                onPressed: () {

                  _boxLogin.clear();
                  _boxLogin.put("loginStatus", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();

                      },
                    ),
                  );
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          )
        ],

        backgroundColor: Color(0x89BD7840),

        //backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      backgroundColor: Color(0xFFF4DEC6),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10,bottom: 15),
          width: h*5,
          height: w*1,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: mostView,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];

                    return Container(
                      width: 300,
                      height: h*1,
                      child:Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Image.network(item['IMAGE']),
                            Text(item['NAME'],style: TextStyle(color: Color(0xF5623813),fontSize: 30,fontWeight: FontWeight.bold),),

                            Text(item['TYPE'],style: TextStyle(color: Color(
                                0xF5000000),fontSize: 20,fontWeight: FontWeight.bold),),
                            Text(item['Description']),
                            Divider(
                              color: Colors.black,
                            ),


                          ],
                        ),
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
      ),

    );
  }
}
