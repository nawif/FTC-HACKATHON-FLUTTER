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
    return
        new Scaffold(
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
//              getRegularWidgets(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(decoration: InputDecoration(labelText: 'علق')),
              ),
            ],
          ),
      ),
    );
//      },
//    );

  }
  Map<String, bool> valuesCars = {
    'Car11': false,
    'Car12': false,
    'Car13': false,
    'Car14': false,
    'Car15': false,
    'Car16': false,
    'Car17': false,
    'Car18': false,
    'Car19': false,
    'Car20': false,
    'Car21': false,
  };
  List<Widget> getRegularWidgets() {
    List<Widget> widgets = valuesCars.keys.map((key) {
      return new CheckboxListTile(
          title: new Text(key),
          value: valuesCars[key],
          onChanged: (bool value) {
            setState(() {
              valuesCars[key] = !valuesCars[key];
            });
          });
    }).toList();

    return widgets;
  }
}
