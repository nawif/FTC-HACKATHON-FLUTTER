import 'package:flutter/material.dart';
import 'post.dart';

void main() {
  runApp(GroupView());
}

class GroupView extends StatefulWidget {
  @override
  _GroupViewState createState() => new _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  final int groupId = 1;
  final List<Group> members = new List();
  final List<Event> events = new List();
  List<Event> currentEvents = new List();
  List<Event> prevEvents = new List();
  List<Event> comingEvents = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      members.add(new Group(
        'https://www.ftcksu.com/v1/users/getUserImage/3',
        'نواف القعيد',
        'المشاريع المنجزة:12',
      ));
      members.add(new Group(
        'https://www.ftcksu.com/v1/users/getUserImage/4',
        'عبادة العرابي',
        'المشاريع المنجزة:11',
      ));
      members.add(new Group(
        'https://www.ftcksu.com/v1/users/getUserImage/5',
        'نفر ثاني',
        'المشاريع المنجزة:110',
      ));

      events.add(new Event("Flutter hackathon1", "A very cool hackathon ", "date", null, EventType.ComingSoon));
      events.add(new Event("Flutter hackathon2", "A very cool hackathon ", "date", null, EventType.inProgress));
      events.add(new Event("Flutter hackathon3", "A very cool hackathon ", "date", null, EventType.Finished));
      events.add(new Event("Flutter hackathon4", "A very cool hackathon ", "date", null, EventType.Finished));
      events.add(new Event("Flutter hackathon5", "A very cool hackathon ", "date", null, EventType.Finished));
      events.add(new Event("Flutter hackathon6", "A very cool hackathon ", "date", null, EventType.Finished));
      events.add(new Event("Flutter hackathon7", "A very cool hackathon ", "date", null, EventType.Finished));
      events.add(new Event("Flutter hackathon8", "A very cool hackathon ", "date", null, EventType.Finished));


      organizeEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مجموعة' + groupId.toString(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('مجموعة' + groupId.toString()),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              itemCount: 4 + members.length + events.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                if (position == 0) return getColTitle("أعضاء الفريق");

                if (position <= members.length) return getColMember(position);
                if (position == members.length + 1) return getColTitle("الفعاليات الحالية");
                if (position <= members.length + currentEvents.length + 1) {
                  return getColEvent(currentEvents[position - members.length - 2]);
                }
                if (members.length + currentEvents.length + 2 == position) {
                  return getColTitle("الفعاليات القادمة");
                }
                if (position < members.length + currentEvents.length + 3 + comingEvents.length) {
                  return getColEvent(comingEvents[position - members.length - 3 - currentEvents.length]);
                }
                if (position == members.length + currentEvents.length + 3 + comingEvents.length ) {
                  return getColTitle("الفعاليات السابقة");
                }
                return getColEvent(prevEvents[position - (members.length + currentEvents.length + 4 + comingEvents.length)]);
              }),
        ),
      ),
    );
  }

  Widget getColMember(int position) {
    return new Container(
//      height: 50,
        child: new Column(
      children: <Widget>[
        ListTile(
          title: Text(
            '${members[position - 1].title}',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.deepOrangeAccent,
            ),
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
          onTap: () => _onTapItem(context, members[position - 1]),
        ),
      ],
    ));
  }

  Column getColTitle(String title) {
    return new Column(children: <Widget>[
      Center(
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
      ),
      Divider(height: 0),
    ]);
  }

  Column getColEvent(Event e) {
    return new Column(
      children: <Widget>[
        ListTile(
          title: Text(
            e.name,
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.deepOrangeAccent,
            ),
          ),
          subtitle: Text(
            e.date + "\n" + e.body,
            style: new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),      Divider(height: 0),

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

  void _onTapItem(BuildContext context, Group post) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(post.body + ' - ' + post.title)));
  }
}
