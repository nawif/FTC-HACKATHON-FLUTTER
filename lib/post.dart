class Group {
  final String url;
  final String title;
  final String body;
  List<Events> events;

  Group(this.url, this.title, this.body, this.events);
}


class Events {
  final String name;
  final String date;
  List<int> checkedItems;
  EventType eventType;


  Events(this.name,this.date,this.checkedItems);
}
enum EventType{
  ComingSoon, Finished,inProgress
}