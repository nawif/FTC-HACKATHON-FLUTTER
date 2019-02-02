import 'package:flutter/material.dart';
import 'post.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EconomyDetails extends StatefulWidget {
  final List<Receipt> receipts;

  final int amountUsed;
  final int amountDocumented;
  final int amountUndocumented;

  EconomyDetails({Key key, this.receipts, this.amountUsed, this.amountDocumented, this.amountUndocumented}) : super();

  EconomyDetailsState createState() => new EconomyDetailsState(receipts, amountUsed, amountDocumented, amountUndocumented);
}

class EconomyDetailsState extends State<EconomyDetails> {
  EconomyDetailsState(this.receipts, this.amountUsed, this.amountDocumented, this.amountUndocumented, {Key key});

  final List<Receipt> receipts;

  final int amountUsed;
  final int amountDocumented;
  final int amountUndocumented;
  static final int maxAmount = 25000;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, position) {
        return new Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "الميزانية",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                new Card(
                  child: new Column(
                    children: <Widget>[
                      getProgressCircle(amountUsed, maxAmount, context, Colors.blue, "الميزانية", 0.7,Text("تم صرف " + amountUsed.toString() + "\n"+" من أصل " + maxAmount.toString())),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          getProgressCircle(amountDocumented, amountUsed, context, Colors.blue, "الموثق", 0.3,null),
                          getProgressCircle(amountUndocumented, amountUsed, context, Colors.blue, "الغير موثق", 0.3,null),
                        ],
                      ),
                      Divider(),
//                ListView.builder(itemBuilder: null)
                    ],
                  ),
                ),
                Text(
                  "الفواتير",
                  style: Theme.of(context).textTheme.title,
                ),
                Directionality(
										textDirection: TextDirection.rtl,
                  child: Column(
                    children: new List.generate(
                      receipts.length,
                      (index) => Card(
                            child: ListTile(
                              trailing: Text(receipts[index].from),
                              title: Text(
                                receipts[index].member.name,
                              ),
                              leading:new Container(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(receipts[index].member.url),
                                  radius: 25.0,
                                ),
                              ),
															subtitle: Text(receipts[index].amount.toString() + " ريال"),
                            ),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  getProgressCircle(int amount, int max, BuildContext context, Color color, String title, double size,Widget innerWidget) {
    double percentage = amount / max;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          new CircularPercentIndicator(
            radius: MediaQuery.of(context).size.width * size,
            percent: percentage,
            center: innerWidget == null ?Text(
              (percentage * 100).toStringAsFixed(2) + "%",
              style: new TextStyle(fontSize: 18.0),
            ): innerWidget,
            backgroundColor: Colors.grey,
            lineWidth: 10 * size,
            progressColor: color,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          )
        ],
      ),
    );
  }
}
