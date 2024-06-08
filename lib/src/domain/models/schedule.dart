class Schedule {
  String? id;
  String? title;
  String? body;
  bool? eachSunday;
  bool? eachMonday;
  bool? eachTuesday;
  bool? eachWednesday;
  bool? eachThursday;
  bool? eachFriday;
  bool? eachSaturday;
  DateTime? scheduledDate;
  String? time;

  Schedule(
      {this.id,
      this.title,
      this.body,
      this.eachSunday,
      this.eachMonday,
      this.eachTuesday,
      this.eachWednesday,
      this.eachThursday,
      this.eachFriday,
      this.eachSaturday,
      this.scheduledDate,
      this.time});
}
