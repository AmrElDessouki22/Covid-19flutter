import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hospitals extends StatefulWidget {

  @override
  _HospitalsState createState() => _HospitalsState();
}



Future<Position> postion()  {
  return  Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
Future<http.Response> fetchAlbum(mylocation,body,headers) {
  return http.post('https://hticovid-19.herokuapp.com/getnearbyhospital',body:JsonEncoder().convert(mylocation),headers:headers);
}
Future<List> postrequest()async  {
  Position position = await postion();
  Map<String, String> headers = {"Content-Type": "application/json"};
  Map<String, String> mylocation = {"lon":position.longitude.toString(),"lat":position.latitude.toString()};
  http.Response resp = await fetchAlbum(mylocation, JsonEncoder().convert(mylocation), headers);
  List responsebody = jsonDecode(resp.body.toString());
  return responsebody;
}
class _HospitalsState extends State<Hospitals> {


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المستشفايات'),
      ),
      body:FutureBuilder(
        future: postrequest(),
        // ignore: missing_return
        builder: (context,snapshot){
          switch (snapshot.connectionState)
          {

            case ConnectionState.none:
              return Container(
                alignment: Alignment.center,
                child: Text("Loading"),
              );
              break;
            case ConnectionState.waiting:
              return Container(
                alignment: Alignment.center,
                child: Text("Loading"),
              );
              break;
            case ConnectionState.active:
              return Container(
                alignment: Alignment.center,
                child: Text("Loading"),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                // return whatever you'd do for this case, probably an error
                return Container(
                  alignment: Alignment.center,
                  child: Text("Error: ${snapshot.error}"),
                );
              }
              return   ListView.builder(
                  itemCount:   snapshot.data.length,
                  itemBuilder: (BuildContext context,int index) {

                    return Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Theme.of(context).accentColor,),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                width: double.infinity,
                                child: Center(child: Text(snapshot.data[index]['name'],style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 19,fontWeight: FontWeight.bold),)),
                              ),
                            ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[

                               Padding(
                                 padding: EdgeInsets.all(8),
                                 child: Container(
                                   padding: EdgeInsets.all(5),
                                   color: Theme.of(context).accentColor,
                                   child: Center(child: Text(snapshot.data[index]['distance']['distance']+' '+snapshot.data[index]['distance']['unit'],style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 19,fontWeight: FontWeight.bold),)),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.all(8),
                                 child: Container(
                                   padding: EdgeInsets.all(5),
                                   color: Theme.of(context).accentColor,
                                   child: Center(child: Text('المسافة بينك وبين المستشفي',style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 19,fontWeight: FontWeight.bold),)),
                                 ),
                               ),
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
      ),
    );
  }







}
