import 'package:api_demo1/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/employee_controller.dart';
import 'signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  loginController  login= Get.put(loginController());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  employeecontoller getUser= Get.put(employeecontoller());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ],
          ),

          SizedBox(height: h*0.02,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: w*1,
                height: h*0.08,

                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(

                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: h*0.02,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: w*1,
                height: h*0.08,

                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(

                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: h*0.02,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  login.login_count(
                      email.text,
                      password.text,
                  ).then((value) {
                    getUser.employee_count();
                  });
    },
                child: Obx(
                   () {
                    return Container(
                      alignment: Alignment.center,
                      width: w*0.4,
                      height: h*0.08,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:
                          login.loading.value?CircularProgressIndicator():

                      Text("LOGIN",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 5),),
                    );
                  }
                ),
              ),
            ],
          ),

          SizedBox(height: h*0.02,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Don't Have an Account?"),
              InkWell(
                  onTap: (){
                    setState(() {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> signup()));
                    });
                  },
                  child: Text("signup",style: TextStyle(color:Colors.blue,fontSize: 15,fontWeight: FontWeight.bold,decoration:TextDecoration.underline,decorationColor: Colors.blue),)
              ),

            ],
          ),
        ],
      ),
    );
  }
}
