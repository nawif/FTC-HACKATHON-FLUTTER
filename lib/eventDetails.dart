import 'package:flutter/material.dart';
import 'post.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class eventDetails extends StatelessWidget {
  Event event;

  eventDetails({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            new IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child:new  Row(
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
                          percent: event.percentage,
                          center: new Text(
                            (event.percentage*100).toString()+"%",
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
            new Divider(height: 5,),
            Text(
              event.body,
              style: Theme.of(context).textTheme.body2,
            )

          ],
        ),
      ),
    );
  }
}
