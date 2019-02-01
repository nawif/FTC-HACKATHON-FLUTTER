class Group {
  final int id;
  final String leaderUrl;
  final String title;
  final String body;
  List<Event> events;
  List<Member> members;

  Group(this.id,this.leaderUrl, this.title, this.body, this.events,this.members);
}

class Member {
  final String url;
  final String name;

  Member(this.url,this.name);


}

class Event {
  final String name;
  final String body;
  final String date;
  List<int> checkedItems;
  EventType eventType;

  String returnEventStatus(){
    
    switch (eventType) {
      case EventType.ComingSoon:
        return "قريباً";
        break;
      case EventType.Finished:
        return "منتهي";
        break;
      case EventType.inProgress:
        return "قيد العمل";
        break;
      default:
        return "wtf";
    }
  }

  Event(this.name,this.body,this.date,this.checkedItems,this.eventType);
}
enum EventType{
  ComingSoon, Finished,inProgress
}