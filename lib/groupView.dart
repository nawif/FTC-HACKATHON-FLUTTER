import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'post.dart';
import 'reportView.dart';
import 'eventDetails.dart';

class GroupView extends StatelessWidget {
//  GroupView(this.groupId,this.members,this.events);
  GroupView(int id, List<Member> members, List<Event> events) {
    this.groupId = id;
    this.members = members;
    this.events = events;
    organizeEvents();
  }

  GroupView.fromGroup(Group g) {
    this.groupId = g.id;
    this.members = g.members;
    this.events = g.events;
    organizeEvents();
  }

  int groupId = 1;
  List<Member> members = new List();
  List<Event> events = new List();
  List<Event> currentEvents = new List();
  final List<Event> prevEvents = new List();
  List<Event> comingEvents = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مجموعة ' + groupId.toString()),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
            itemCount: 4 + members.length + events.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (context, position) {
              if (position == 0) return getColTitle("أعضاء الفريق", context);

              if (position <= members.length) return getColMember(position, context);
              if (position == members.length + 1) return getColTitle("الفعاليات الحالية", context);
              if (position <= members.length + currentEvents.length + 1) {
                return getColEvent(currentEvents[position - members.length - 2], context);
              }
              if (members.length + currentEvents.length + 2 == position) {
                return getColTitle("الفعاليات القادمة", context);
              }
              if (position < members.length + currentEvents.length + 3 + comingEvents.length) {
                return getColEvent(comingEvents[position - members.length - 3 - currentEvents.length], context);
              }
              if (position == members.length + currentEvents.length + 3 + comingEvents.length) {
                return getColTitle("الفعاليات السابقة", context);
              }
              return getColEvent(prevEvents[position - (members.length + currentEvents.length + 4 + comingEvents.length)], context);
            }),
      ),
    );
  }

  Widget getColMember(int position, BuildContext context) {
    return Card(
      child: ListTile(
        trailing: Icon(Icons.person),
        title: Text(
          '${members[position - 1].name}',
        ),
        leading: Container(
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('${members[position - 1].url}'),
            radius: 25.0,
          ),
        ),
      ),
    );
  }

  Column getColTitle(String title, BuildContext context) {
    return new Column(children: <Widget>[
      ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      Divider(height: 10),
    ]);
  }

  Column getColEvent(Event e, BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(e.name),
                subtitle: getProgressBar(e.percentage,context),
                onTap: () => _onTapItem(context, e),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getProgressBar(double percentage,BuildContext context) {
    return Center(
      child: Container(
//        color: Colors.red,
        child: new LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width * 0.1, 0),
          lineHeight: 20.0,
          percent: percentage,
          center: Text(
            (percentage * 100).toString() + "%",
            style: new TextStyle(fontSize: 12.0),
          ),
        leading: Icon(Icons.event),
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
      ),
    );
  }

  void organizeEvents() {
    for (int i = 0; i < events.length; i++) {
      final e = events[i];
      if (e.eventType == EventType.ComingSoon)
        this.comingEvents.add(e);
      else if (e.eventType == EventType.inProgress)
        this.currentEvents.add(e);
      else
        this.prevEvents.add(e);
    }
  }

  void _onTapItem(BuildContext context, Event e) {
    if (e.eventType == EventType.Finished)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportView
          (new EventReport(e, ["https://www.ftcksu.com/v1/users/getUserImage/50",
        "https://www.ftcksu.com/v1/users/getUserImage/64",
        "https://www.ftcksu.com/v1/users/getUserImage/62"], "35 نفر و 7 نفرات","دزاياسبيستبيستمسن","5 أيام","25 ساعة","عبادة عرابي، نواف القعيد"))),

      );
    else
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => eventDetails(event: e)),
      );
  }
}
