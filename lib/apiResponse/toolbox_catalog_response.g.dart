/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-07 16:13:53
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 16:20:38
 * @FilePath: /speak/lib/apiResponse/toolbox_catalog_response.g.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toolbox_catalog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolboxCatalogResponse _$ToolboxCatalogResponseFromJson(
        Map<String, dynamic> json) =>
    ToolboxCatalogResponse(
      total: (json['total'] as num).toInt(),
      rows: (json['rows'] as List<dynamic>)
          .map((e) => ToolboxCatalogItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ToolboxCatalogResponseToJson(
        ToolboxCatalogResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
    };

ToolboxCatalogItem _$ToolboxCatalogItemFromJson(Map<String, dynamic> json) =>
    ToolboxCatalogItem(
      createBy: json['createBy'],
      createTime: json['createTime'],
      updateBy: json['updateBy'],
      updateTime: json['updateTime'],
      remark: json['remark'],
      aiId: json['aiId'] as String,
      catalogueId: json['catalogueId'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      synopsis: json['synopsis'] as String,
      commandLogic: json['commandLogic'] as String,
      status: json['status'] as String,
      mongoAppId: json['mongoAppId'] as String,
      mongoApiKey: json['mongoApiKey'] as String,
    );

Map<String, dynamic> _$ToolboxCatalogItemToJson(ToolboxCatalogItem instance) =>
    <String, dynamic>{
      'createBy': instance.createBy,
      'createTime': instance.createTime,
      'updateBy': instance.updateBy,
      'updateTime': instance.updateTime,
      'remark': instance.remark,
      'aiId': instance.aiId,
      'catalogueId': instance.catalogueId,
      'url': instance.url,
      'name': instance.name,
      'synopsis': instance.synopsis,
      'commandLogic': instance.commandLogic,
      'status': instance.status,
      'mongoAppId': instance.mongoAppId,
      'mongoApiKey': instance.mongoApiKey,
    };
