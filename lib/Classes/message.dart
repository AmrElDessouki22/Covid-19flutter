import 'package:chatapp/Classes/Emeg.dart';
import 'package:flutter/cupertino.dart';


final asaf = Emerg(id: 1,number: '123 ',Desc: 'الاسعاف',imageurl: AssetImage('images/hossam.jpg'));

final shorta = Emerg(id: 2,number: '122',Desc: 'الشرطه',imageurl: AssetImage('images/medhat.jpg'));

final corona = Emerg(id: 3,number: '105 ',Desc: 'وزارة الصحة',imageurl: AssetImage('images/karim.jpg'));

final ahmed = Emerg(id: 4,number: '114',Desc: 'شكوي التجمعات',imageurl: AssetImage('images/medhat.jpg'));


final List<Emerg> fav = [corona,asaf,shorta,ahmed];




