import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class massengerScreen extends StatelessWidget {
  const massengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/images/profilepic.jpg'),
                // NetworkImage(
                //     'https://www.facebook.com/photo/?fbid=1320979871977795&set=a.103671957041932')
            ),
            SizedBox(
              width: 10,
            ),
            Text("Chats",style:
              TextStyle(color: Colors.black),)
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(Icons.camera_alt
              ),
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.blue,
              child: Icon(Icons.edit
              ),
            ),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                padding: EdgeInsets.all(5.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0,),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children:
                  [
                    Icon(
                        Icons.search
                    ),
                    SizedBox(width: 20,),
                    Text("Search",)
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context,index)=> SizedBox(width: 15.0,),
                  itemCount: 12,
                ),
              ),
              SizedBox(height: 40.0,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context , index)=> buildChatItem(),
                separatorBuilder: (context,index)=> SizedBox(height: 20.0,),
                itemCount: 15,
              ),
            ],
          ),

        ),

      ),
    );
  }


  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
                'https://www.facebook.com/photo/?fbid=1320979871977795&set=a.103671957041932'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.red,
            ),
          ),


        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("abdo shalaby"),
            SizedBox(
              height: 5.0,
            ),
            Row(children: [
              Text("3amel eh ya habib 2lby",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),

                ),
              ),
              Text("2:00 pm")
            ],),
          ],
        ),),
    ],
  );
  Widget buildStoryItem() => Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://www.facebook.com/photo/?fbid=1320979871977795&set=a.103671957041932'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.red,
              ),
            ),
            // CircleAvatar(
            //   radius: 8.0,
            //   backgroundColor: Colors.white,
            // ),
          ],
        ),
        SizedBox(height: 5.0,),
        Text('Abdulrahman shalaby',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
      ],
    ),
  );
}


