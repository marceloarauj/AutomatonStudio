import 'package:estudio_automato/load/models/StateModal.dart';
import 'package:estudio_automato/load/models/TransitionModal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'FiniteDeterministicModel.g.dart';
@JsonSerializable()
class FiniteDeterministicModel {

  FiniteDeterministicModel(this.Type,this.States,this.Transitions);

  String Type;
  List<StateModal> States;
  List<TransitionModal> Transitions;

  factory FiniteDeterministicModel.fromJson(Map<String, dynamic> json) => _$FiniteDeterministicModelFromJson(json);
  toJson() => _$FiniteDeterministicModelToJson(this);
}