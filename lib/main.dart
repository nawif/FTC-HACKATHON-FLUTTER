import 'package:flutter/material.dart';
import 'post.dart';
import 'groupView.dart';

void main() {
  runApp(ListViewApp());
//  GroupView g = GroupView(1, [new Member('https://www.ftcksu.com/v1/users/getUserImage/3', "nawaf"), new Member('https://www.ftcksu.com/v1/users/getUserImage/4', 'عبادة عرابي')], []);
//  g.initState();
//  runApp(g);
}

class ListViewApp extends StatefulWidget {
  @override
  _ListViewState createState() => new _ListViewState();
}

class _ListViewState extends State<ListViewApp> {
  final List<Group> items = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(new Group(1, 'https://www.ftcksu.com/v1/users/getUserImage/3', 'نواف القعيد', 'المشاريع المنجزة:12', [
        new Event("فريق التطوير", "رصد اعمال الفريق", "2019-01-11", [0], EventType.Finished)
      ], []));
      items.add(new Group(2, 'https://www.ftcksu.com/v1/users/getUserImage/4', 'عبادة عرابي', 'المشاريع المنجزة:11', [
        new Event("فريق التطوير", "رصد اعمال الفريق", "2019-01-11", [0], EventType.Finished)
      ], []));
      items.add(new Group(3, 'https://www.ftcksu.com/v1/users/getUserImage/5', 'سعود القحطاني', 'المشاريع المنجزة:110', [
        new Event("فريق التطوير", "رصد اعمال الفريق", "2019-01-11", [0], EventType.Finished)
      ], []));
      items.add(new Group(4, 'https://www.ftcksu.com/v1/users/getUserImage/6', 'خالد العجلان', 'المشاريع المنجزة:12', [
        new Event("فريق التطوير", "رصد اعمال الفريق", "2019-01-11", [0], EventType.Finished)
      ], []));
      items.add(new Group(5, 'https://www.ftcksu.com/v1/users/getUserImage/7', 'ناصر العواجي', 'المشاريع المنجزة:12', [
        new Event("فريق التطوير", "رصد اعمال الفريق", "2019-01-11", [0], EventType.Finished)
      ], []));
      items.add(new Group(6, 'https://www.ftcksu.com/v1/users/getUserImage/8', 'ماجد الخثعمي', 'المشاريع المنجزة:12', [
        new Event("فريق التطوير", "رصد اعمال الفريق", "2019-01-11", [0], EventType.Finished)
      ], []));
      items.add(new Group(7, 'https://www.ftcksu.com/v1/users/getUserImage/9', 'عبدالله الحجي', 'المشاريع المنجزة:12', [
        new Event("فريق التطوير", "رصد اعمال الفريق", "2019-01-11", [0], EventType.Finished)
      ], []));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'قائمة قادة المجموعات',
      home: Scaffold(
        appBar: AppBar(
          title: Text('قائمة قادة المجموعات'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${items[position].title}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].body}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage('${items[position].leaderUrl}'),
                            radius: 35.0,
                          ),
                        ],
                      ),
                      onTap: () => _onTapItem(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _onTapItem(BuildContext context, Group post) {
    Navigator.push(
      context,
//      MaterialPageRoute(builder: (context) => SecondRoute(event: post.events[0])),

      MaterialPageRoute(builder: (context) => GroupView.fromGroup(post)),
    );
  }
}

class SecondRoute extends StatelessWidget {
  Event event;

  SecondRoute({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'تاريخ الأنتهاء: ${event.date}',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily:'Cairo',
              color: Colors.deepOrangeAccent,
            ),
          ),
          Text(
            'حالة المشروع: ${event.returnEventStatus()}',
            style: TextStyle(
              fontFamily:'Cairo',
              fontSize: 22.0,
              color: Colors.deepOrangeAccent,
            ),
          ),
          Text(event.date),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
        ],
      )),
    );
  }
}
