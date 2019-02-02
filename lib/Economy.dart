import 'package:flutter/material.dart';
import 'post.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class eventDetails extends StatefulWidget {
  Event event;

  eventDetails({Key key, @required this.event}) : super();

  eventDetailsState createState() => new eventDetailsState(event: this.event);
}

class eventDetailsState extends State<eventDetails> {
  Event event;
  eventDetailsState({Key key, @required this.event});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              new IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new Column(children: [
                        Container(
                          child: Text(
                            'تاريخ الأنتهاء: ${event.date}',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                        Container(
                          child: Text(
                            'حالة المشروع: ${event.returnEventStatus()}',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ]),
                      new Expanded(
                        child: Container(
                          child: new CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 10.0,
                            animation: true,
                            percent: event.percentage,
                            center: new Text(
                              (event.percentage * 100).toString() + "%",
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
              new Divider(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  event.body,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              getRegularWidgets(0),
              getRegularWidgets(1),
              getRegularWidgets(2),
              getRegularWidgets(3),
              getRegularWidgets(4),
              getRegularWidgets(5),
              getRegularWidgets(6),
              getRegularWidgets(7),
              getRegularWidgets(8),
              getRegularWidgets(9),
              getRegularWidgets(10),
              getRegularWidgets(11),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(decoration: InputDecoration(labelText: 'علق')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: new RaisedButton(
                  child: const Text('ارسل'),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> checkListTitle = ['التأكيد على الحجز مع 22|67', 'التواصل مع الضيف', 'الترتيب المسبق', 'التسويق بشكل مكثف', 'بانر وبوستر', 'التأكد من توفر التغذية', 'التواجد قبل الفعالية والتأكد من كل شيء', 'التنظيم خلال الفعالية', 'ترتيب المكان بعد الفعالية', 'احضار وارجاع المستلزمات من والى النادي', 'التأكد من توفر البث "قائد المجموعة"', 'جميع ما هو ضروري ولم يتم ذكره اعلاه'];
  static List<bool> checkListState = [false, false, false, false, false, false, false, false, false, false, false, false];
  CheckboxListTile getRegularWidgets(position) {
    return  CheckboxListTile(
        title: new Text(checkListTitle[position]),
        value: checkListState[position],

        onChanged: (bool value) {
          setState(() {
            checkListState[position] = !checkListState[position];
          });
        });
  }
}
