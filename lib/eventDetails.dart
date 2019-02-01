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
      body: Align(

          alignment: Alignment.topRight,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'تاريخ الأنتهاء: ${event.date}',
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                'حالة المشروع: ${event.returnEventStatus()}',
                style: Theme.of(context).textTheme.title,
              ),

              Align(
                alignment: Alignment.center,
                child: new CircularPercentIndicator(
                  radius: 180.0,
                  lineWidth: 20.0,
                  animation: true,
                  percent: 0.7,
                  center: new Text(
                    "70.0%",
                    style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  footer: new Text(
                    "منجز من الفعالية",
                    style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                ),
              ),
            ],
          )),
    );
  }
}