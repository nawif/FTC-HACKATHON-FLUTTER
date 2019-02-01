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
  final List<Event> prevEvents = new List();
  List<Event> comingEvents = new List();

  void initState() {
//      members.add(new Group(
//        'https://www.ftcksu.com/v1/users/getUserImage/3',
//        'نواف القعيد',
//        'المشاريع المنجزة:12',null
//      ));
//      members.add(new Group(
//        'https://www.ftcksu.com/v1/users/getUserImage/4',
//        'عبادة العرابي',
//        'المشاريع المنجزة:11',null
//      ));
//      members.add(new Group(
//        'https://www.ftcksu.com/v1/users/getUserImage/5',
//        'نفر ثاني',
//        'المشاريع المنجزة:110',null
//      ));

    events.add(new Event("Flutter hackathon1", "A very cool hackathon ", "date", null, EventType.ComingSoon));
    events.add(new Event("Flutter hackathon2", "A very cool hackathon ", "date", null, EventType.inProgress));
    events.add(new Event("Flutter hackathon3", "A very cool hackathon ", "date", null, EventType.Finished));
    events.add(new Event("Flutter hackathon4", "A very cool hackathon ", "date", null, EventType.Finished));
    events.add(new Event("Flutter hackathon5", "A very cool hackathon ", "date", null, EventType.Finished));
    events.add(new Event("Flutter hackathon6", "A very cool hackathon ", "date", null, EventType.Finished));
    events.add(new Event("Flutter hackathon7", "A very cool hackathon ", "date", null, EventType.Finished));
    events.add(new Event("Flutter hackathon8", "A very cool hackathon ", "date", null, EventType.Finished));

    organizeEvents();
  }

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
              return getColEvent( prevEvents[position - (members.length + currentEvents.length + 4 + comingEvents.length)], context);
            }),
      ),
    );
  }


  Widget getColMember(int position, BuildContext context) {
    return new Column(
      children: <Widget>[
        Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    '${members[position - 1].name}',
                  ),
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('${members[position - 1].url}'),
                      radius: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
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
    Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              ListTile(
                title: Text(e.name),
                subtitle: Text(e.body),
                onTap: () => _onTapItem(context, e),
              ),
          ],
        ),
      ),
    )
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
