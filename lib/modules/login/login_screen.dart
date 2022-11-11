import 'package:flutter/material.dart';

import '../../shared/componant/componant.dart';
import '../../shared/componant/conectants.dart';


class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Shalaboka"),
        actions: [
          IconButton(onPressed: nofication, icon: Icon(Icons.search),),
          IconButton(onPressed: () {
            print("click");
          }, icon: Icon(Icons.notifications),)

        ],
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                ),
                 const SizedBox(
                  height: 20.0,
                ),
                // DefaultFormField(
                //   controller:emailController,
                //   keyboardType: TextInputType.emailAddress,
                //  validator: (value){
                //    if(value.isEmpty){
                //      return'email must not be empty';
                //    }
                //    return null;
                //  },
                //   labelText: 'Email',
                //   prefixIcon:  Icons.email,
                // ),
                defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value){
                      if(value!.isEmpty){
                        return'email must not be empty';
                      }
                      return null;
                    },
                    label: 'Email',
                    prefix: Icons.email,
                ),
               const SizedBox(
                  height: 15.0,
                ),
    //             DefaultFormField(
    //               controller: passwordController,
    //                 keyboardType:TextInputType.visiblePassword,
    //               validator: (value){
    // if(value.isEmpty){
    // return'Passsword is to short';
    // }
    // return null;
    // },
    // isPassword: isPasswordShow,
    // // suffixIcon: (){
    // //   setState((){
    // //     isPasswordShow = !isPasswordShow;
    // // });
    // // },
    //               labelText: 'Passsword',
    //               prefixIcon:  Icons.lock,
    //
    //             ),
                defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (String? value){
                       if(value!.isEmpty){
                        return'Passsword is to short';
                      }
                       return null;
                    },
                  isPassword: isPasswordShow,
                  suffixPressed: (){
                    setState((){
                      isPasswordShow = !isPasswordShow;
                    });
                  },
                  label: 'Passsword',
                  prefix: Icons.lock,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  text: 'login',
                  function: () {
                    if (formkey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  },
                  radius: 10.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont\'t have an account"),
                    TextButton(onPressed: (){},
                        child: Text("Register now")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void nofication() {
    print("hi ya raye2");
  }
}

