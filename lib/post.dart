class Group {
  final int userId;
  final String url;
  final String title;
  final String body;
  List<Events> events;

  Group(this.userId, this.url, this.title, this.body);
}


class Events {
  final String name;
  final String date;
  final List<int> checkedItems;

  Events(this.name,this.date,this.checkedItems);
}