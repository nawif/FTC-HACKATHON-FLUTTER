import 'package:flutter/material.dart';
import 'post.dart';

void main() {
  runApp(ListViewApp());
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
        'نفر ثاني',
        'المشاريع المنجزة:110',
      ));
      items.add(new Post(
        2,
        'https://www.ftcksu.com/v1/users/getUserImage/6',
        'نواف القعيد',
        'المشاريع المنجزة:12',
      ));
      items.add(new Post(
        3,
        'https://www.ftcksu.com/v1/users/getUserImage/7',
        'نواف القعيد',
        'المشاريع المنجزة:12',
      ));
      items.add(new Post(
        3,
        'https://www.ftcksu.com/v1/users/getUserImage/8',
        'نواف القعيد',
        'المشاريع المنجزة:12',
      ));
      items.add(new Post(
        3,
        'https://www.ftcksu.com/v1/users/getUserImage/9',
        'نواف القعيد',
        'المشاريع المنجزة:12',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSA ListView Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Demo'),
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
                            backgroundColor: Colors.black.withOpacity(0),
                            radius: 35.0,
                            child: Image.network(
                            '${items[position].url}',
        )
        ,
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