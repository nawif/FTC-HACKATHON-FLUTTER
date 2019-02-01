class Event {
  final int eventID;
  final String title;
  final String body;
  final DateTime deadLine;
  final EventType eventType;

  Event(this.eventID, this.title, this.body,this.deadLine,this.eventType);
}
enum EventType{
  ComingSoon,Finished,inProgress
}