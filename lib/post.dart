class Group {
  final int id;
  final int leaderID;
  final String title;
  final String body;
  List<Event> events;
  List<Member> members;

  Group(this.id, this.leaderID, this.title, this.body, this.events, this.members);

  Member getLeader() {
    for (var i = 0; i < members.length; i++) {
      if (members[i].id == leaderID) {
        return members[i];
      }
    }
    return members[0];
  }

  static Group getDumbData(int id) {
    return new Group(id, 3, "مجموعة عبادة الأسطورة", "هذي مجموعة عبادة", [
      Event(
          "هاكاثون فلتر",
          "هاكثون تطوير التطبيقات باستخدام Flutter خاص لاعضاء النادي -لمدة ثلاث ايام من ٣١ يناير الى نهاية يوم السبت وبعد هذا يتوج الفريق الفائز وينعطى جائزة",
          "2019/1/1",
          [1, 1, 1],
          EventType.inProgress, 0.3),
      Event("هاكاثون فلتر", "body", "2019/1/1", [1, 1, 1], EventType.inProgress,0.88)
    ], [
      new Member('https://www.ftcksu.com/v1/users/getUserImage/${id}', "نواف", 1),
      new Member('https://www.ftcksu.com/v1/users/getUserImage/${id++v}', "عبادة", 62)
    ]);
  }
}

class Member {
  final String url;
  final String name;
  final int id;

  Member(this.url, this.name, this.id);
}

class Event {
  final String name;
  final String body;
  final String date;
  final double percentage;
  List<int> checkedItems;
  EventType eventType;

  String returnEventStatus() {
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

  Event(this.name, this.body, this.date, this.checkedItems, this.eventType, this.percentage);
}

enum EventType { ComingSoon, Finished, inProgress }
