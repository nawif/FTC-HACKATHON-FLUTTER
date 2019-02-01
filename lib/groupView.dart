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
  final List<Group> members = new List();
  final List<Event> events = new List();

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

      events.add(new Event("Flutter hackathon", "A very cool hackathon ","date",null,EventType.ComingSoon));
      events.add(new Event("Flutter hackathon", "A very cool hackathon ","date",null,EventType.ComingSoon));

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أعضاء المجموعة',
      home: Scaffold(
        appBar: AppBar(
          title: Text('أعضاء المجموعة'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: 2 + members.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                if (position == 0)
                  return new Column(children: <Widget>[
                    Center(
                      child: ListTile(
                        title: Text(
                          'أعضاء المجموعة',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                    )
                  ]);

                if (position <= members.length)
                  return new Column(
                    children: <Widget>[
                      Divider(height: 5.0),
                      ListTile(
                        title: Text(
                          '${members[position - 1].title}',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        subtitle: Text(
                          '${members[position - 1].body}',
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${members[position - 1].url}'),
                              radius: 35.0,
                            ),
                          ],
                        ),
                        onTap: () => _onTapItem(context, members[position - 1]),
                      ),
                    ],
                  );
                if (position == members.length + 1)
                  return new Column(children: <Widget>[
                    Divider(height: 5.0),
                    Center(
                      child: ListTile(
                        title: Text(
                          'الفعاليات الحالية',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                    )
                  ]);
                if (position > members.length + 1)
                {
                  return new Column(
                    children: <Widget>[
                      Divider(height: 5.0),
                      ListTile(
                        title: Text(
                          '${events[position -members.length].title}',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        subtitle: Text(
                          '${events[position -members.length].body}',
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        onTap: () => _onTapItem(context, members[position - 1]),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }

  void _onTapItem(BuildContext context, Post post) {
    Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text(post.body + ' - ' + post.title)));
  }
}
