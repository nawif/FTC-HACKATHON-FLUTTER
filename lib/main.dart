import 'package:flutter/material.dart';
import 'post.dart';
import 'groupView.dart';
import 'Economy.dart';
import 'Jawdah.dart';

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
  int _selectedIndex = 0;
  List<String> titles = ['قائمة قادة المجموعات', 'الميزانية','الجودة'];
  List<Widget> bodies = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(Group.getDumbData(1));
      items.add(Group.getDumbData(2));

			bodies.add(Center(
				child: ListView.builder(
						itemCount: items.length,
						padding: const EdgeInsets.all(15.0),
						itemBuilder: (context, position) {
							return getGroupCard(items[position], context);
						}),
			));

			bodies.add(EconomyDetails(amountDocumented: 5213,amountUndocumented: 3015,amountUsed: 5213+3015,receipts: [
				new Receipt("Ya Mal Al sham", new Member("https://www.ftcksu.com/v1/users/getUserImage/58", "عبادة", 165235), 1520,"https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/ReceiptSwiss.jpg/170px-ReceiptSwiss.jpg"),
				new Receipt("اكسير", new Member("https://www.ftcksu.com/v1/users/getUserImage/50", "محمد", 165235), 251,"https://invoicesimple1.wpengine.com/wp-content/uploads/2018/06/Receipt-Template-top.png"),
			],));

			bodies.add(JawadahView(events: Group.getDumbData(2).events,));
//      items.add(Group.getDumbData(3));
//      items.add(Group.getDumbData(4));
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      print(index);
      setState(() {
        _selectedIndex = index;
      });
    }

    return MaterialApp(
      title: 'قائمة قادة المجموعات',
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,

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
            body2: TextStyle(
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
            ),
            subhead: TextStyle(
              fontSize: 20.0,
            )),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(titles[_selectedIndex]),
          centerTitle: true,
          // backgroundColor: pri,
        ),
        body: bodies[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.group), title: Text('المجموعات')),
						BottomNavigationBarItem(icon: Icon(Icons.monetization_on), title: Text('الميزانية')),
						BottomNavigationBarItem(icon: Icon(Icons.thumb_up), title: Text('الجودة')),

					],
          currentIndex: _selectedIndex,
          fixedColor: Colors.deepPurple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Column getGroupCard(Group g, context) {
    return new Column(
      children: <Widget>[
        Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${g.getLeader().url}'),
                    radius: 35.0,
                  ),
                  trailing: Icon(Icons.group),
                  title: Text(g.title),
                  subtitle: Text(g.body),
                  onTap: () => _onTapItem(context, g),
                ),
              ],
            ),
          ),
        )
      ],
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
