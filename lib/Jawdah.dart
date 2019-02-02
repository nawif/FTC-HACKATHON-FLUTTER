import 'package:flutter/material.dart';
import 'post.dart';
import 'recieptView.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class JawadahView extends StatefulWidget {
  final List<Event> events;

  JawadahView({Key key, this.events}) : super();

  JawadahViewState createState() => new JawadahViewState(events);
}

class JawadahViewState extends State<JawadahView> {

  JawadahViewState(this.events, {Key key});

  final List<Event> events;

  static final int maxAmount = 25000;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, position) {
        return new Container(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "..." + "بانتظار الموافقة",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                new Column(
                  children: new List.generate(
                      events.length,
                      (index) => events[index].eventType == EventType.waitingApproval
                          ? new GestureDetector(
                              onTap: () => _onTap(context, index),
                              child: new Card(
                                child: ListTile(
                                  trailing: Column(
                                    children: <Widget>[
                                      Text(events[index].date),
                                      new RaisedButton(
                                        child: const Text('اقبل'),
                                        color: Theme.of(context).accentColor,
                                        elevation: 4.0,
                                        splashColor: Colors.blueGrey,
                                        onPressed: () {},
                                      ),
                                      new RaisedButton(
                                        child: const Text('ارفض'),
                                        color: Colors.red,
                                        elevation: 4.0,
                                        splashColor: Colors.blueGrey,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    events[index].name,
                                  ),
                                  subtitle: Text(events[index].body),
                                ),
                              ),
                            )
                          : Container()),
                ),
                new Text(
                  "المشاريع المرفوضة",
                  style: Theme.of(context).textTheme.title,
                ),
                Column(
                  children: new List.generate(
                      events.length,
                      (index) => events[index].eventType == EventType.rejected
                          ? new GestureDetector(
                              onTap: () => _onTap(context, index),
                              child: new Card(
                                child: ListTile(
                                  trailing: Text(events[index].date),
                                  title: Text(
                                    events[index].name,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(events[index].body),
                                      Divider(
                                        height: 10,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            events[index].rejectionComment == null ? "" : "سبب الرفض:",
                                            style: Theme.of(context).textTheme.title,
                                          ),
                                          Text(
                                            events[index].rejectionComment == null ? "" : events[index].rejectionComment,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  getProgressCircle(int amount, int max, BuildContext context, Color color, String title, double size, Widget innerWidget) {
    double percentage = amount / max;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          new CircularPercentIndicator(
            radius: MediaQuery.of(context).size.width * size,
            percent: percentage,
            center: innerWidget == null
                ? Text(
                    (percentage * 100).toStringAsFixed(2) + "%",
                    style: new TextStyle(fontSize: 18.0),
                  )
                : innerWidget,
            backgroundColor: Colors.grey,
            lineWidth: 10 * size,
            progressColor: color,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          )
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
//		Navigator.push(
//			context,
////      MaterialPageRoute(builder: (context) => SecondRoute(event: post.events[0])),
//
//			MaterialPageRoute(builder: (context) => RecieptView(receipts[index])),
//		);
  }
}
