import 'package:chatapp/Hospitals.dart';
import 'package:flutter/material.dart';

import '../Weight/fav.dart';

class Viewpager1 extends StatefulWidget {
  @override
  _Viewpager1State createState() => _Viewpager1State();
}

class _Viewpager1State extends State<Viewpager1> {
  int index=0;
  int true_ = 0;
  int false_ = 0;
  List<String> questions = [
    'هل سافرت مؤخراً، ؟',
    'هل خالطت احد مصاب ؟',
    'هل كنت تستضيف أي شخص في منزلك',
    'هل  كان لديك زميل عمل، أو زميل في المدرسة قد سافر؟',
    'هل كنت تستضيف أي شخص في منزلك من مناطق يتركز فيها تفشي المرض؟',
    'هل كنت على متن سفينة سياحية؟',
    'هل تعيش بالقرب من منطقة يوجد فيها تفشي للفيروس؟',
    'هل تشعر بالحمي ؟',
    'هل تشعر بالسعال ؟',
    'هل تشعر بضيق النفس ؟',
    'هل تشعر بالتعب العام ؟',
    'هل تشعر بالتهاب الحلف ؟'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 6,
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              children: <Widget>[Fav()],
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xFFfdfaf9),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 130,left: 30,right: 30),
                  child: Text(
                    index <questions.length-1 ? questions[index]:showresult(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: index <questions.length-1 ?Theme.of(context).primaryColor:Theme.of(context).accentColor,
          child: RawMaterialButton(
            onPressed: (){
              setState(() {
                if(index <questions.length-1) {
                  true_ = true_ + 1;
                  index = index + 1;
                }
              });
            },
              child: Container(
            width: double.infinity,
            child: Center(
                child: Text('نعم',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
          )),
        ),
        Container(

          height: 10,
          color: Theme.of(context).accentColor,
        ),
        Container(
          color: Theme.of(context).primaryColor,
          child: RawMaterialButton(
              onPressed: () {
                setState(() {
            if(index <questions.length-1) {
              false_ = false_ + 1;
              index = index + 1;
              }else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Hospitals()));
                }
                });
              },
              child: Container(
                width: double.infinity,
                child: Center(
                    child: Text(
                      index < questions.length-1?'لا': ' المستشفيات '
                  ,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              )),
        ),
      ],
    );
  }

  String showresult()
  {
       double result  = (true_ / questions.length) * 100 ;
       return '% '+result.toStringAsFixed(2) +'احتمالية اصابتك هي ';
  }
}
