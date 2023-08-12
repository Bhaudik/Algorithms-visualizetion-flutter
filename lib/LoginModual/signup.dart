import 'package:flutter/material.dart';
import 'login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  @override

  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.width;
    final w = MediaQuery.of(context).size.height;
    return SafeArea(

      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: h*0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: w*0.4,
                    height: h*0.09,
                    child: TextFormField(
                      controller: fname,
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: "First Name",
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
                    width: w*0.4,
                    height: h*0.08,

                    child: TextFormField(
                      controller: lname,
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: "Last Name",
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
                    width: w*0.4,
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
                    width: w*0.4,
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
                  GestureDetector(
                    onTap: (){
                      register.register_count(
                          email.text,
                          password.text,
                          fname.text,
                          lname.text,
                      );
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
                          register.loading.value?CircularProgressIndicator(color: Colors.white,):
                          Text("SIGNUP",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 5),),
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

                  Text("Already Have an Account?"),

                  Text("Don't Have an Account?"),
                  InkWell(
                      onTap: (){
                        setState(() {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
                        });
                      },
                      child: Text("Login",style: TextStyle(color:Colors.blue,fontSize: 15,fontWeight: FontWeight.bold,decoration:TextDecoration.underline,decorationColor: Colors.blue),)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
