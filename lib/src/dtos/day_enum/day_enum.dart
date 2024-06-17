enum Day { SUN, MON, TUE, WED, THU, FRI, SAT }

extension DayExtension on Day {
  String get value {
    switch (this) {
      case Day.MON:
        return "Mon";
      case Day.SUN:
        return "Sun";
      case Day.TUE:
        return "Tue";
      case Day.WED:
        return "Wed";
      case Day.THU:
        return "Thu";
      case Day.FRI:
        return "Fri";
      case Day.SAT:
        return "Sat";
      default:
        throw Exception();
    }
  }

  int get id {
    switch (this) {
      case Day.MON:
        return 0;
      case Day.SUN:
        return 1;
      case Day.TUE:
        return 2;
      case Day.WED:
        return 3;
      case Day.THU:
        return 4;
      case Day.FRI:
        return 5;
      case Day.SAT:
        return 6;
    }
  }
}
