import 'dart:ui';
import '../ApiServices/api_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Sign_in_Sign_up/login.dart';
import 'details.dart';
import 'ground.dart';
class home extends StatefulWidget {
  const home({super.key});


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  ApiService fatchtype=ApiService();
  late Future<List<Map<String, dynamic>>> types;
  late Future<List<Map<String, dynamic>>> mostView;
  late Future<List<Map<String, dynamic>>> recentview;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    types=fatchtype.all_type();
    mostView=fatchtype.fetchData();
    recentview=fatchtype.recent();
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
            Image.asset("assets/Images/name.png"),
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
          child:Column(
            children: [



              //user name and information
              Column(
                children: [
                  //
                  Container(
                    margin: EdgeInsets.only(top: 35,left: 30),
                    child: Row(
                      children: [

                        Text("Hii, ",style: TextStyle(color: Color(0xff986736),fontSize: 30,fontWeight: FontWeight.bold),),
                        Text(_boxLogin.get("userName"),
                         // style: Theme.of(context).textTheme.headlineLarge
                          style: TextStyle(color:Color(0xFf341803),fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                        //Text("Govinda",style: TextStyle(color:Color(0xFf341803),fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("what do you want to learn Today ?",style: TextStyle(color:Color(0xFf341803),fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],
              ),
              //Algorithm Search bar
              Container(
                margin: EdgeInsets.only(top: 20),
                width: w*0.99,
                height: 50,
                child: TextFormField(

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    hintText: "Search Algo..",
                    suffixIcon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
                        },
                        child: Icon(Icons.search)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ) ,
                ),
              ),
              SingleChildScrollView(
                child:Container(
                  margin: EdgeInsets.only(top: 10,bottom: 15),
                  width: w*5,
                  height: 50,
                  child: FutureBuilder<List<Map<String , dynamic>>>(
                    future: types,
                    builder: (context, snapshot) {

                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final item = snapshot.data![index];

                            return Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ground(title: item['NAME'],),));
                                },

                                child: Container(

                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(2),
                                  height: h*0.25,
                                  width: w*0.24,

                                  child:

                                  Text(item['NAME'],style: TextStyle(color:Color(0xffce9158),fontWeight: FontWeight.bold,fontSize: 30 ),),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFf341803),
                                  ),
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
              Container(
                child:Column(
                  children: [
                    Text("All Algorithms"),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
              ),
              ),
              //most view
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 10,bottom: 15),
                  width: h*5,
                  height: w*0.25,
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: mostView,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final item = snapshot.data![index];
                            return Container(
                                child:Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => detail(title: item['ID'],),));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      height: h*0.1,
                                      width: w*0.36,
                                      child: Image.network(item['IMAGE']),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //color: Color(0xFf341803),
                                      ),
                                    ),
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
              Container(
                child:Column(
                  children: [
                    Text("Recently Viewed"),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              //recently view
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 10,bottom: 15),
                  width: w*5,
                  height: w*0.25,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: img.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(1),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ground(title: "Recently view",),));
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            height: h*0.1,
                            width: w*0.36,
                            child: Image.asset(img[index]),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Color(0xFf341803),
                            ),
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return Container(margin: EdgeInsets.only(right: 10),);
                  }, ),//color: Colors.grey,
                ),
              ),
              Container(
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
