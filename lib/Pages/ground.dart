import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import '../Sign_in_Sign_up/login.dart';
class ground extends StatefulWidget {


  const ground({super.key, required this.title});
  final String title;



  @override
  State<ground> createState() => _groundState();
}

class _groundState extends State<ground> {


  var all = [
    'assets/DFS/LinkList/CLL.png',
    'assets/DFS/LinkList/DLL.png',
    'assets/DFS/LinkList/SLL.png',
    'assets/DFS/Searching/BinarySearch.png',
    'assets/DFS/Searching/BinarySearch.png',
    'assets/DFS/Sorting/BubbleSort.png',
    'assets/DFS/Sorting/SelectionSort.png',
    'assets/DFS/Sorting/BucketSort.png',
    'assets/DFS/Sorting/HeepSort.png',
    'assets/DFS/Sorting/InsertionSort.png',
    'assets/DFS/Sorting/MergeSort.png',
    'assets/DFS/Sorting/QuickSort.png',
    'assets/DFS/Sorting/RedaxSort.png',
    'assets/DFS/Tree/BinarySearchTree.png',
    'assets/DFS/Tree/BinaryTree.png',
    'assets/DFS/Tree/BTree.png',
    'assets/OS/Sheduling/FCFS.png',
    'assets/OS/Sheduling/MultilevelQueue.png',
    'assets/OS/Sheduling/Priority.png',
    'assets/OS/Sheduling/RoundRobin.png',
    'assets/OS/Sheduling/SJF.png',
    'assets/OS/Sheduling/SRT.png'
  ];
  var sorting = [
    'assets/DFS/Sorting/BubbleSort.png',
    'assets/DFS/Sorting/SelectionSort.png',
    'assets/DFS/Sorting/BucketSort.png',
    'assets/DFS/Sorting/HeepSort.png',
    'assets/DFS/Sorting/InsertionSort.png',
    'assets/DFS/Sorting/MergeSort.png',
    'assets/DFS/Sorting/QuickSort.png',
    'assets/DFS/Sorting/RedaxSort.png'
  ];
  var search = [
    'assets/DFS/Searching/BinarySearch.png',
    'assets/DFS/Searching/LinearSearch.png'
  ];
  var linklist = [
    'assets/DFS/LinkList/CLL.png',
    'assets/DFS/LinkList/DLL.png',
    'assets/DFS/LinkList/SLL.png'
  ];
  var tree = [
    'assets/DFS/Tree/BinarySearchTree.png',
    'assets/DFS/Tree/BinaryTree.png',
    'assets/DFS/Tree/BTree.png'
  ];
  var sheduling = [
    'assets/OS/Sheduling/FCFS.png',
    'assets/OS/Sheduling/MultilevelQueue.png',
    'assets/OS/Sheduling/Priority.png',
    'assets/OS/Sheduling/RoundRobin.png',
    'assets/OS/Sheduling/SJF.png',

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Box _boxLogin = Hive.box("login");
    var data = widget.title;
    var temp=[];
    if (data == 'sheduling') {
      temp=sheduling;
    }
    else if(data=='Sorting')
      {
        temp=sorting;
      }
    else if(data=='Searching')
    {
      temp=search;
    }
    else if(data=='LinkedList')
    {
      temp=linklist;
    }
    else if(data=='Tree')
    {
      temp=tree;
    }
    else
      {
        temp=sheduling;
      }
    print(temp);

    return Scaffold(
      appBar: AppBar(
    leading: Image.asset("assets/Images/icon.png"),
    title: Row(
    children: [
      Text(data,style: TextStyle(color: Color(0xF5623813),fontSize: 30,fontWeight: FontWeight.bold),),
    ],
    ),
    //Text(Image.asset("assets/Images/name.png")),
    //actions: [Image.asset("assets/Images/favicon.png")],
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
      ),

      backgroundColor: Color(0xFFF4DEC6),
      body: Container(
        child: GridView.builder(itemBuilder: (context, index) {
          return Container(child: Image.asset(temp[index]),);
        },itemCount:temp.length,
          gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 5,
              mainAxisExtent: 140,
              maxCrossAxisExtent: 210,
              mainAxisSpacing: 0,
              childAspectRatio: 2),),
      ),


    );
  }
}
