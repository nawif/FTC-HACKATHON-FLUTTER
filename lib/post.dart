class Group {
  final String url;
  final String title;
  final String body;
  List<Event> events;

  Group(this.url, this.title, this.body);
}


class Event {
  final String name;
  final String body;
  final String date;
  List<int> checkedItems;
  EventType eventType;


  Event(this.name,this.body,this.date,this.checkedItems,this.eventType);
}
enum EventType{
  ComingSoon, Finished,inProgress
}