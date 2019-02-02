import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'post.dart';
import 'main.dart';
import 'eventDetails.dart';

class RecieptView extends StatelessWidget {
  Receipt r;

  RecieptView(this.r);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "فاتورة " + r.member.name,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            new Directionality(
              textDirection: TextDirection.rtl,
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      trailing: Text(r.from),
                      title: Text(r.member.name),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(r.member.url),
                        radius: 35.0,
                      ),
                      subtitle: Text(r.amount.toString() + " ريال"),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "الصورة",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            new Card(child: Image(image: NetworkImage(r.picURL)))
          ],
        ),
      ),
    );
  }
}
