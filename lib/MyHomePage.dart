import 'package:chatapp/Hospitals.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'Viewpager/Viewpager2.dart';
import 'Viewpager/viewpager3.dart';
import 'Viewpager/viewpager.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
Future<Position> post() async{
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return position;
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post().then((position){

    });

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'الاختبار',
              ),
              Tab(
                text: 'الاخبار',
              ),
              Tab(
                text: 'الاحصائيات',
              )
            ],
          ),
          title: Text('كورونا فيروس'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_vert), iconSize: 30, onPressed: () {}),
          ],
        ),
        body:TabBarView(
          children: <Widget>[
            Viewpager1(),
            Viewpager2(),
            Viewpager3()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Hospitals()));
          },
          child: Icon(Icons.local_hospital , color: Colors.red,),
        ),

      ),
    );
  }

}
