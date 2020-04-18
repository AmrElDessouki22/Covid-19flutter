import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Viewpager2 extends StatefulWidget {
  @override
  _Viewpager2State createState() => _Viewpager2State();
}

Future<http.Response> response() {
  Map<String, String> header = {'Content-Type': 'application/json'};
  return http.get('https://hticovid-19.herokuapp.com/news', headers: header);
}

Future<List> news() async {
  http.Response news_ = await response();
  List news__ = jsonDecode(news_.body.toString());
  return news__;
}

class _Viewpager2State extends State<Viewpager2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: news(),
      // ignore: missing_return
      builder: (context, snapdata) {
        switch (snapdata.connectionState) {
          case ConnectionState.none:
            return Container(
              alignment: Alignment.center,
              child: Text("Loading",style: TextStyle(color: Colors.white),),
            );
            break;
          case ConnectionState.waiting:
            return Container(
              alignment: Alignment.center,
              child: Text("Loading",style: TextStyle(color: Colors.white)),
            );
            break;
          case ConnectionState.active:
            return Container(
              alignment: Alignment.center,
              child: Text("Loading",style: TextStyle(color: Colors.white)),
            );
            break;
          case ConnectionState.done:
            List news = snapdata.data;
            return ListView.builder(
                itemCount: news.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(news[index]['title']);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 200,
                                child: Image.network(news[index]['image_link']),
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                    child: Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: Text(
                                  news[index]['title'],
                                  style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                ),
                                    )),
                              )
                            ],
                          ),
                        ),
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
