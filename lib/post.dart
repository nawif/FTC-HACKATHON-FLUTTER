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
    switch (id) {
      case 1:
        {
          return new Group(id, 3, "مجموعة عبادة الأسطورة", "هذي مجموعة عبادة", [
            Event("هاكاثون فلتر", "هاكثون تطوير التطبيقات باستخدام Flutter خاص لاعضاء النادي -لمدة ثلاث ايام من ٣١ يناير الى نهاية يوم السبت وبعد هذا يتوج الفريق الفائز وينعطى جائزة", "2019/1/1", [1, 1, 1], EventType.inProgress, 0.3),
            Event("هاكاثون فلتر", "هاكثون تطوير التطبيقات باستخدام Flutter خاص لاعضاء النادي -لمدة ثلاث ايام من ٣١ يناير الى نهاية يوم السبت وبعد هذا يتوج الفريق الفائز وينعطى جائزة", "2019/1/1", [1, 1, 1], EventType.Finished, 0.88)
          ], [
            new Member('https://www.ftcksu.com/v1/users/getUserImage/${id}', "نواف", 3),
            new Member('https://www.ftcksu.com/v1/users/getUserImage/${id}', "عبادة", 62)
          ]);
        }
      case 2:
        {
          Event rejected = Event("reject هاكاثون فلتر", "هاكثون تطوير التطبيقات باستخدام Flutter خاص لاعضاء النادي -لمدة ثلاث ايام من ٣١ يناير الى نهاية يوم السبت وبعد هذا يتوج الفريق الفائز وينعطى جائزةreject",
            "2019/1/1", [1, 1, 1], EventType.rejected, 0.88,);
          rejected.rejectionComment = " سعدون يريد ذلك";
          return new Group(id, 3, "مجموعة نواف الأسطورة", "هذي مجموعة نواف", [
            Event("محاضرة الأمن السيبراني", "ينظّم نادي تقنية المستقبل محاضرة شيّقة بعنوان الأمن السيبراني مع د. محمد المشيقح. بالمحاور التالية: ١. الأمن السيبراني ضرورة للعالم الرقمي. ٢. الأمن السيبراني وأمن المعلومات ٣. كيف أحمي نفسي ومنظمتي؟ ٤. كيف أتخصص وأطور نفسي في هذا المجال؟", "2019/1/2", [1, 1, 1], EventType.inProgress, 1.0),
            Event("هاكاثون فلتر", "هاكثون تطوير التطبيقات باستخدام Flutter خاص لاعضاء النادي -لمدة ثلاث ايام من ٣١ يناير الى نهاية يوم السبت وبعد هذا يتوج الفريق الفائز وينعطى جائزة", "2019/1/1", [1, 1, 1], EventType.inProgress, 0.88),
            Event("هاكاثون فلتر waiting approval", " waiting approvalهاكثون تطوير التطبيقات باستخدام Flutter خاص لاعضاء النادي -لمدة ثلاث ايام من ٣١ يناير الى نهاية يوم السبت وبعد هذا يتوج الفريق الفائز وينعطى جائزة", "2019/1/1", [1, 1, 1], EventType.waitingApproval, 0.88),
            rejected,
          ], [
            new Member('https://www.ftcksu.com/v1/users/getUserImage/${id}', "نواف", 3),
            new Member('https://www.ftcksu.com/v1/users/getUserImage/${id + 1}', "عبادة", 50)
          ]);
        }
    }
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
  String rejectionComment;
  String returnEventStatus() {
    switch (eventType) {
      case EventType.ComingSoon:
        return "قريباً";
      case EventType.Finished:
        return "منتهي";
      case EventType.inProgress:
        return "قيد العمل";
      case EventType.waitingApproval:
        return "بانتظار الموافقة";

      case EventType.rejected:
        return "لم يوافق عليه";
      default:
        return "wtf";
    }
  }

  Event(this.name, this.body, this.date, this.checkedItems, this.eventType, this.percentage);
}

class EventReport {
  final Event event;
  final List<String> pictures;
  final String attendence;
  final String guests;
  final String timeDays;
  final String timeHours;
  final String organazires;

  EventReport(this.event, this.pictures, this.attendence, this.guests, this.timeDays, this.timeHours, this.organazires);
}

class Receipt {
  final String from;
  final Member member;
  final int amount;
  final String picURL;

  Receipt(this.from, this.member, this.amount, this.picURL);
}

enum EventType { ComingSoon, Finished, inProgress, waitingApproval, rejected }
