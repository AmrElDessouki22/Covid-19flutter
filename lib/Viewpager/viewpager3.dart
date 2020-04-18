import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Viewpager3 extends StatefulWidget {
  @override
  _Viewpager3State createState() => _Viewpager3State();
}
Future<http.Response> rsponse()async{
  Map<String,String> header = {'Content-Type':'application/json'};
  return await http.get('https://hticovid-19.herokuapp.com/statistics',headers: header);
}
Future<List> statistics() async{
  http.Response response_ = await rsponse();
  List statistics_ = jsonDecode(response_.body.toString());
  print(statistics_);
  return statistics_;
}
class _Viewpager3State extends State<Viewpager3> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: statistics(),
      // ignore: missing_return
      builder: (context , snapdata){
        switch(snapdata.connectionState)
        {
          case ConnectionState.none:
            return Container(
              alignment: Alignment.center,
              child: Text('loading',style: TextStyle(color: Colors.white)),
            );
            break;
          case ConnectionState.waiting:
            return Container(
              alignment: Alignment.center,
              child: Text('loading',style: TextStyle(color: Colors.white)),
            );
            break;
          case ConnectionState.active:
            return Container(
              alignment: Alignment.center,
              child: Text('loading',style: TextStyle(color: Colors.white)),
            );
            break;
          case ConnectionState.done:
            List statistics = snapdata.data;
            return ListView.builder(
                itemCount: statistics.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 4,),
                          Text(statistics[index]['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('توقي',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                              Text('تعافي',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                              Text('الاجمالي',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: <Widget>[
                              Text(statistics[index]['death'],style: TextStyle(color: Colors.red,fontSize: 15,),),
                              Text(statistics[index]['recovered'],style: TextStyle(color: Colors.green,fontSize: 15,),),
                              Text(statistics[index]['total'],style: TextStyle(color: Colors.black,fontSize: 15,),)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
            break;
        }
      },
    );
  }
}
