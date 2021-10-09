import 'package:json_annotation/json_annotation.dart';

part 'TransitionModal.g.dart';
@JsonSerializable()
class TransitionModal {

  TransitionModal(this.fromID,this.fromX,this.fromY,this.toID,this.toX,this.toY);

  int fromID;
  int toID;
  double fromX;
  double fromY;
  double toX;
  double toY;

  factory TransitionModal.fromJson(Map<String, dynamic> json) => _$TransitionModalFromJson(json);
  toJson() => _$TransitionModalToJson(this);
}