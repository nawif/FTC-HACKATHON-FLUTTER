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
			theme: ThemeData(
				// Define the default Brightness and Colors
//        brightness: Brightness.dark,
//        primaryColor: Colors.lightBlue[800],
//        accentColor: Colors.cyan[600],

				// Define the default Font Family
				fontFamily: 'Cairo',

				// Define the default TextTheme. Use this to specify the default
				// text styling for headlines, titles, bodies of text, and more.
				textTheme: TextTheme(
						headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
						title: TextStyle(
							fontSize: 22.0,
							fontWeight: FontWeight.bold,
						),
						body1: TextStyle(
							fontSize: 18.0,
							fontStyle: FontStyle.italic,
						),
						subhead: TextStyle(
							fontSize: 20.0,
						)
				),
			),
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
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        '${items[position].body}',
                        style: Theme.of(context).textTheme.body1,
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
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            'حالة المشروع: ${event.returnEventStatus()}',
            style: Theme.of(context).textTheme.title,
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
