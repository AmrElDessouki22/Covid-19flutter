import 'package:flutter/material.dart';
import 'package:chatapp/Classes/message.dart';
import 'package:flutter/services.dart';

class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.blueGrey,
                  size: 30,
                ),
                onPressed: () {},
              ),
              Text(
                'ارقام الطوارئ',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          )
        ),
        Container(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: fav.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()
                      {
                        Clipboard.setData(ClipboardData(text: fav[index].number));
                      },
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: fav[index].imageurl,
                          ),
                          SizedBox(height: 5,),
                          Text(fav[index].number,style: TextStyle(color:Colors.blueGrey,fontSize: 18,fontWeight: FontWeight.bold),),
                          Text(fav[index].Desc,style: TextStyle(color:Colors.blueGrey,fontSize: 13,fontWeight: FontWeight.bold),)

                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
