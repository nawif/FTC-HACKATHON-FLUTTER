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
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              Text(
                er.event.name,
                style: Theme.of(context).textTheme.title,
              )
            ],
          ),
        ),
      ),
    );
  }
}
