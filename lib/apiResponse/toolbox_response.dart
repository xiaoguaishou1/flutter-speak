/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-07 10:57:27
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 11:26:06
 * @FilePath: /speak/lib/apiResponse/toolbox_response.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

part 'toolbox_response.g.dart';

@JsonSerializable()
class ToolboxList {
  final String msg;
  final int code;
  final List<Data> data;

  ToolboxList({required this.msg, required this.code, required this.data});

  factory ToolboxList.fromJson(Map<String, dynamic> json) =>
      _$ToolboxListFromJson(json);

  Map<String, dynamic> toJson() => _$ToolboxListToJson(this);
}

@JsonSerializable()
class Data {
  final dynamic createBy;
  final dynamic createTime;
  final dynamic updateBy;
  final dynamic updateTime;
  final dynamic remark;
  final String catalogueId;
  final String name;
  final int orderNum;

  Data({
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
    required this.catalogueId,
    required this.name,
    required this.orderNum,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
