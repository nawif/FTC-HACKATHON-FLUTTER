import 'package:flutter/material.dart';
import 'post.dart';
import 'groupView.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
      items.add(Group.getDumbData(1));
      items.add(Group.getDumbData(2));
      items.add(Group.getDumbData(3));
      items.add(Group.getDumbData(4));
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
                            backgroundImage: NetworkImage(
                                '${items[position].getLeader().url}'),
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
      body: Align(
        
        alignment: Alignment.topRight,
        child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'تاريخ الأنتهاء: ${event.date}',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Cairo',
              color: Colors.deepOrangeAccent,
            ),
          ),
          Text(
            'حالة المشروع: ${event.returnEventStatus()}',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 22.0,
              color: Colors.deepOrangeAccent,
            ),
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
