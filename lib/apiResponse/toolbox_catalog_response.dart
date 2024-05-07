/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-07 16:05:54
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 16:20:37
 * @FilePath: /speak/lib/apiResponse/toolbox_catalog_response.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

part 'toolbox_catalog_response.g.dart';

@JsonSerializable()
class ToolboxCatalogResponse {
  final int total;
  final List<ToolboxCatalogItem> rows;

  ToolboxCatalogResponse({required this.total, required this.rows});

  factory ToolboxCatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$ToolboxCatalogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToolboxCatalogResponseToJson(this);
}

@JsonSerializable()
class ToolboxCatalogItem {
  final dynamic createBy;
  final dynamic createTime;
  final dynamic updateBy;
  final dynamic updateTime;
  final dynamic remark;
  final String aiId;
  final String catalogueId;
  final String url;
  final String name;
  final String synopsis;
  final String commandLogic;
  final String status;
  final String mongoAppId;
  final String mongoApiKey;

  ToolboxCatalogItem({
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
    required this.aiId,
    required this.catalogueId,
    required this.url,
    required this.name,
    required this.synopsis,
    required this.commandLogic,
    required this.status,
    required this.mongoAppId,
    required this.mongoApiKey,
  });

  factory ToolboxCatalogItem.fromJson(Map<String, dynamic> json) =>
      _$ToolboxCatalogItemFromJson(json);

  Map<String, dynamic> toJson() => _$ToolboxCatalogItemToJson(this);
}
