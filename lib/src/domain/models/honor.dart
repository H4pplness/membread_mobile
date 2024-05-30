import 'package:equatable/equatable.dart';

enum HONOR {
  NEWBIE,
  BAGUETTE,
  SANDWICH,
  JAMBONBEURRE,

  WAITER,
  BAKER,
  VICECOOK,
  MASTERCHEF,
}

extension HonorExtension on HONOR {
  String get value {
    switch (this) {
      case HONOR.NEWBIE:
        return 'newbie';
      case HONOR.BAGUETTE:
        return 'baguette';
      case HONOR.SANDWICH:
        return 'sandwich';
      case HONOR.JAMBONBEURRE:
        return 'jambonbeurre';
      case HONOR.WAITER:
        return 'waiter';
      case HONOR.BAKER:
        return 'baker';
      case HONOR.VICECOOK:
        return 'vicecook';
      case HONOR.MASTERCHEF:
        return 'masterchef';
      default:
        return '';
    }
  }

  static HONOR fromString(String value) {
    switch (value) {
      case 'newbie':
        return HONOR.NEWBIE;
      case 'baguette':
        return HONOR.BAGUETTE;
      case 'sandwich':
        return HONOR.SANDWICH;
      case 'jambonbeurre':
        return HONOR.JAMBONBEURRE;
      case 'waiter':
        return HONOR.WAITER;
      case 'baker':
        return HONOR.BAKER;
      case 'vicecook':
        return HONOR.VICECOOK;
      case 'masterchef':
        return HONOR.MASTERCHEF;
      default:
        throw ArgumentError('Invalid honor value: $value');
    }
  }

  int get score {
    switch (this) {
      case HONOR.NEWBIE:
        return 10000;
      case HONOR.BAGUETTE:
        return 50000;
      case HONOR.SANDWICH:
        return 100000;
      case HONOR.JAMBONBEURRE:
        return 500000;
      case HONOR.WAITER:
        return 10000;
      case HONOR.BAKER:
        return 10000;
      case HONOR.VICECOOK:
        return 50000;
      case HONOR.MASTERCHEF:
        return 100000;
      default:
        return 0;
    }
  }

  String get image {
    switch (this) {
      case HONOR.NEWBIE:
        return 'assets/newbie_achievement.jpg';
      case HONOR.BAGUETTE:
        return '';
      case HONOR.SANDWICH:
        return '';
      case HONOR.JAMBONBEURRE:
        return '';
      case HONOR.WAITER:
        return '';
      case HONOR.BAKER:
        return '';
      case HONOR.VICECOOK:
        return '';
      case HONOR.MASTERCHEF:
        return '';
      default:
        return '';
    }
  }

  String get description{
    switch(this){
      case HONOR.NEWBIE:
        return 'Get 10000xp in this month to get achievement';
      case HONOR.BAGUETTE:
        return 'Get 50000xp in this month to get achievement';
      case HONOR.SANDWICH:
        return 'Get 100000xp in this month to get achievement';
      case HONOR.JAMBONBEURRE:
        return 'Get 500000xp in this month to get achievement';
      case HONOR.WAITER:
        return '';
      case HONOR.BAKER:
        return '';
      case HONOR.VICECOOK:
        return '';
      case HONOR.MASTERCHEF:
        return '';
      default:
        return '';
    }
  }
}

