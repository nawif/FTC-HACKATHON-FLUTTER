import 'package:flutter/material.dart';
import 'post.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class myApp extends StatefulWidget{
  final Event e;
  myApp(this.e);
  @override
  eventDetails createState() => new eventDetails(event: e);

}


class eventDetails extends State<myApp> {
  Event event;
  static final List<String> checkList = ["الحصول على موافقة المشروع", "التواصل مع الضيف", "بدء فعالية في تطبيق النادي", "طلب تصميم الرول أب", "طلب نشر المشروع على التويتر", "طلب توفير تغذية وتصاريح الدخول", "توزيع الرول أب", "التواجد قبل بدء المشروع", "تنظيم وإدارة المشروع", "تسليم التقرير", "رصد أعمال المنظمين", "اغلاق الفعالية"];
  List<bool> values = new List();

  eventDetails({Key key, @required this.event});

  @override
  Widget build(BuildContext context) {
    values = new List();
    for(int i = 0;i<checkList.length;i++)
      values.add(false);
    return Scaffold(
        appBar: AppBar(
          title: Text(event.name),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, position) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: <Widget>[
                    new Text(
                      event.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    new Card(
                      child: new IntrinsicHeight(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              new Column(children: [
                                Container(
//                  height: 120.0,
//                    color: Colors.yellow,
                                  child: Text(
                                    'تاريخ الأنتهاء: ${event.date}',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                                Container(
//                  height: 100.0,
//                    color: Colors.cyan,
                                  child: Text(
                                    'حالة المشروع: ${event.returnEventStatus()}',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                              ]),
                              new Expanded(
                                child: Container(
//                    color: Colors.amber,
                                  child: new CircularPercentIndicator(
                                    radius: 90.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: 0.7,
                                    center: new Text(
                                      "70.0%",
                                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                    ),
                                    footer: new Text(
                                      "منجز من الفعالية",
                                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.purple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Text(
                      "الوصف",
                      style: Theme.of(context).textTheme.title,
                    ),
                    new Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
                        child: Text(
                          event.body,
                          style: Theme.of(context).textTheme.body2,
                        ),
                      ),
                    ),
                    new Text(
                      "خطوات بناء المشروع",
                      style: Theme.of(context).textTheme.title,
                    ),
                    new ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: checkList.length,
                        itemBuilder: (context, position) {
                          return new Card(
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: values[position],
                                  onChanged: (bool newValue) {

                                  },                                ),
                                Text(
                                  checkList[position],
                                ),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              );
            }));
  }
}
