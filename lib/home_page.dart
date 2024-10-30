import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  validInformation(String email, String password)
  {
    Fluttertoast.showToast(msg: "Email: "+email+" Password: "+password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('TextField Example',style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  onPressed: (){

                    String email=emailController.text;
                    String password=passwordController.text;

                    if(!email.contains("@")||!email.contains("."))
                      {
                        Fluttertoast.showToast(msg: "Invalid Email");
                      }
                    else if(password.length<4)
                      {
                        Fluttertoast.showToast(msg: "Password minimum 4 digit");
                      }
                    else validInformation(email, password);

                  }, child: Text("Submit", style: const TextStyle(color: Colors.white),)),
            ),

          ],
        ),
      ),
    );
  }
}
