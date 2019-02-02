import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'post.dart';
import 'main.dart';
import 'eventDetails.dart';

class ReportView extends StatelessWidget {
  EventReport er;

  ReportView(this.er);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تقرير فعالية ' + er.event.name),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              new Text(
                er.event.name,
                style: Theme.of(context).textTheme.title,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: <Widget>[
                    new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "التاريخ: ",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                new Text(
                                  er.event.date,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "الحضور: ",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                new Text(
                                  er.attendence,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "اسم الضيف: ",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                new Text(
                                  er.guests,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "عدد أيام الفعالية: ",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                new Text(
                                  er.timeDays,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "عدد ساعات الفعالية: ",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                new Text(
                                  er.timeHours,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "المنظمين: ",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                new Text(
                                  er.organazires,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Text(
                      "الوصف",
                      style: Theme.of(context).textTheme.title,
                    ),
                    new Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              er.event.body,
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Text(
                      "صور من الفعالية",
                      style: Theme.of(context).textTheme.title,
                    ),
                    new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: new List.generate(er.pictures.length, (index) => new Card(child: Image(image: NetworkImage(er.pictures[index])))),
//                        new Card(child: Image(image: NetworkImage(er.pictures[position]))),
                        ),
                      ),
                    ),
                    new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: new RaisedButton(
                                child: const Text('عدل'),
                                color: Colors.red,
                                elevation: 4.0,
                                splashColor: Colors.blueGrey,
                                onPressed: () {

                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: new RaisedButton(
                                child: const Text('PDF'),
                                color: Theme.of(context).accentColor,
                                elevation: 4.0,
                                splashColor: Colors.blueGrey,
                                onPressed: () {

                                },
                              ),
                            )
                          ],
//                        new Card(child: Image(image: NetworkImage(er.pictures[position]))),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
