// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StateModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModal _$StateModalFromJson(Map<String, dynamic> json) => StateModal(
      json['id'] as int,
      json['finalState'] as bool,
      json['initialState'] as bool,
      (json['posX'] as num).toDouble(),
      (json['posY'] as num).toDouble(),
    );

Map<String, dynamic> _$StateModalToJson(StateModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'initialState': instance.initialState,
      'finalState': instance.finalState,
      'posX': instance.posX,
      'posY': instance.posY,
    };
