// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransitionModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransitionModal _$TransitionModalFromJson(Map<String, dynamic> json) =>
    TransitionModal(
      json['fromID'] as int,
      (json['fromX'] as num).toDouble(),
      (json['fromY'] as num).toDouble(),
      json['toID'] as int,
      (json['toX'] as num).toDouble(),
      (json['toY'] as num).toDouble(),
    );

Map<String, dynamic> _$TransitionModalToJson(TransitionModal instance) =>
    <String, dynamic>{
      'fromID': instance.fromID,
      'toID': instance.toID,
      'fromX': instance.fromX,
      'fromY': instance.fromY,
      'toX': instance.toX,
      'toY': instance.toY,
    };
