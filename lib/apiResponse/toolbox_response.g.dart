// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toolbox_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolboxList _$ToolboxListFromJson(Map<String, dynamic> json) => ToolboxList(
      msg: json['msg'] as String,
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ToolboxListToJson(ToolboxList instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      createBy: json['createBy'],
      createTime: json['createTime'],
      updateBy: json['updateBy'],
      updateTime: json['updateTime'],
      remark: json['remark'],
      catalogueId: json['catalogueId'] as String,
      name: json['name'] as String,
      orderNum: (json['orderNum'] as num).toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'createBy': instance.createBy,
      'createTime': instance.createTime,
      'updateBy': instance.updateBy,
      'updateTime': instance.updateTime,
      'remark': instance.remark,
      'catalogueId': instance.catalogueId,
      'name': instance.name,
      'orderNum': instance.orderNum,
    };
