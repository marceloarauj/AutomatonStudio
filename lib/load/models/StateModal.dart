import 'package:json_annotation/json_annotation.dart';

part 'StateModal.g.dart';
@JsonSerializable()
class StateModal{

  StateModal(this.id,this.finalState,this.initialState,this.posX,this.posY);

  int id;
  bool initialState;
  bool finalState;
  double posX;
  double posY;

  factory StateModal.fromJson(Map<String, dynamic> json) => _$StateModalFromJson(json);
  toJson() => _$StateModalToJson(this);
}