import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';


class userScreen extends StatelessWidget {

  List<userModel> users = [
    userModel(
        id: 1,
        name: "Abdulrahman",
        phone: "+201021460838"
    ),
    userModel(
        id: 2,
        name: "ahmed",
        phone: "+201221460838"
    ),
    userModel(id: 3,
        name: "osama",
        phone: "+201501460838"
    ),
    userModel(id: 1,
        name: "Abdulrahman",
        phone: "+201021460838"
    ),
    userModel(id: 2,
        name: "ahmed",
        phone: "+201221460838"
    ),
    userModel(id: 3,
        name: "osama",
        phone: "+201501460838"
    ),
    userModel(id: 1,
        name: "Abdulrahman",
        phone: "+201021460838"
    ),
    userModel(id: 2,
        name: "ahmed",
        phone: "+201221460838"
    ),
    userModel(id: 3,
        name: "osama",
        phone: "+201501460838"
    ),
    userModel(id: 1,
        name: "Abdulrahman",
        phone: "+201021460838"
    ),
    userModel(id: 2,
        name: "ahmed",
        phone: "+201221460838"
    ),
    userModel(id: 3,
        name: "osama",
        phone: "+201501460838"
    ),
    userModel(id: 1,
        name: "Abdulrahman",
        phone: "+201021460838"),
    userModel(id: 3,
        name: "osama",
        phone: "+201501460838"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("Users"),
    ),
      body: ListView.separated(
          itemBuilder: (context ,index)=> buildUserItem(users[index]),
          separatorBuilder: (context ,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount:users.length ),
    );
  }
  Widget buildUserItem(userModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 20.0,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
            Text("${user.phone}"
              ,style: TextStyle(color: Colors.grey),)
          ],
        ),
      ],
    ),
  );
}
