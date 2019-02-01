import 'package:flutter/material.dart';
import 'post.dart';
import 'main.dart';
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
  List<Event> prevEvents = new List();
  List<Event> comingEvents = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مجموعة' + groupId.toString()),
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
    return new Container(
//      height: 50,
        child: new Column(
      children: <Widget>[
        ListTile(
          title: Text(
            '${members[position - 1].name}',
            style: Theme.of(context).textTheme.body1,
          ),
//          subtitle: Text(
//            '${members[position - 1].body}',
//            style: new TextStyle(
//              fontSize: 18.0,
//              fontStyle: FontStyle.italic,
//            ),
//          ),
          leading: Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage('${members[position - 1].url}'),
              radius: 25.0,
            ),
          ),
//          onTap: () => _onTapItem(context, members[position - 1]),
        ),
      ],
    ));
  }

  Column getColTitle(String title, BuildContext context) {
    return new Column(children: <Widget>[
      Center(
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      Divider(height: 0),
    ]);
  }

  Column getColEvent(Event e, BuildContext context) {
    return new Column(
      children: <Widget>[
        ListTile(
          title: Text(
            e.name,
            style: Theme.of(context).textTheme.subhead,
          ),
          subtitle: Text(
            e.date + "\n" + e.body,
            style: Theme.of(context).textTheme.body2,
          ),
          onTap: () => _onTapItem(context, e),
        ),
        Divider(height: 0),
      ],
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => eventDetails(event: e)),
    );
  }
}
