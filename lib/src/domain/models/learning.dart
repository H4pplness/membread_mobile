
import 'package:equatable/equatable.dart';

class Learning extends Equatable{
  int? id;

  Learning({this.id});

  @override
  List<Object?> get props => [id];
}