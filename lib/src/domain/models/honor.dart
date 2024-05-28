import 'package:equatable/equatable.dart';

enum HONOR {
  NONE,

  NEWBIE,
  BAGUETTE,
  SANDWICH,
  JAMBONBEURRE,

  WAITER,
  BAKER,
  VICECOOK,
  MASTERCHEF,
}

class Honor extends Equatable {
  int? id;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
