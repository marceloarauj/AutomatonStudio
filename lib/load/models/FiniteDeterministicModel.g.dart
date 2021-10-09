// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FiniteDeterministicModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiniteDeterministicModel _$FiniteDeterministicModelFromJson(
        Map<String, dynamic> json) =>
    FiniteDeterministicModel(
      json['Type'] as String,
      (json['States'] as List<dynamic>)
          .map((e) => StateModal.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Transitions'] as List<dynamic>)
          .map((e) => TransitionModal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FiniteDeterministicModelToJson(
        FiniteDeterministicModel instance) =>
    <String, dynamic>{
      'Type': instance.Type,
      'States': instance.States,
      'Transitions': instance.Transitions,
    };
