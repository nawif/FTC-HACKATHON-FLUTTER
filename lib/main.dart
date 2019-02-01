import 'package:flutter/material.dart';
import 'post.dart';
import 'groupView.dart';

void main() {
//  runApp(ListViewApp());
  runApp(GroupView());
}

class ListViewApp extends StatefulWidget {
  @override
  _ListViewState createState() => new _ListViewState();
}

class _ListViewState extends State<ListViewApp> {
  final List<Post> items = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(new Post(
        1,
        'https://www.ftcksu.com/v1/users/getUserImage/3',
        'نواف القعيد',
        'المشاريع المنجزة:12',
      ));
      items.add(new Post(
        1,
        'https://www.ftcksu.com/v1/users/getUserImage/4',
        'عبادة العرابي',
        'المشاريع المنجزة:11',
      ));
      items.add(new Post(
        2,
        'https://www.ftcksu.com/v1/users/getUserImage/5',
        'سعود القحطاني',
        'المشاريع المنجزة:110',
      ));
      items.add(new Post(
        2,
        'https://www.ftcksu.com/v1/users/getUserImage/6',
        'خالد العجلان',
        'المشاريع المنجزة:12',
      ));
      items.add(new Post(
        3,
        'https://www.ftcksu.com/v1/users/getUserImage/7',
        'ناصر العواجي',
        'المشاريع المنجزة:12',
      ));
      items.add(new Post(
        3,
        'https://www.ftcksu.com/v1/users/getUserImage/8',
        'ماجد الخثعمي',
        'المشاريع المنجزة:12',
      ));
      items.add(new Post(
        3,
        'https://www.ftcksu.com/v1/users/getUserImage/9',
        'عبدالله الحجي',
        'المشاريع المنجزة:12',
      ));
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
                          backgroundImage: NetworkImage('${items[position].url}'),
                            radius: 35.0,
                          ),
                          // IconButton(
                          //   icon: const Icon(Icons.remove_circle_outline),
                          //   onPressed: () {
                          //     setState(() {
                          //       items.removeAt(position);
                          //     });
                          //   },
                          // ),
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

  void _onTapItem(BuildContext context, Post post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.body + ' - ' + post.title)));
  }
}