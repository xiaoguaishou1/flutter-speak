/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-07 10:57:27
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 16:03:54
 * @FilePath: /speak/lib/apiResponse/toolbox_response.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:flutter/src/widgets/gesture_detector.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'toolbox_response.g.dart';

@JsonSerializable()
class ToolboxList {
  final String msg;
  final int code;
  final List<ToolboxListData> data;

  ToolboxList({required this.msg, required this.code, required this.data});

  factory ToolboxList.fromJson(Map<String, dynamic> json) =>
      _$ToolboxListFromJson(json);

  Map<String, dynamic> toJson() => _$ToolboxListToJson(this);

  map(GestureDetector Function(dynamic item) param0) {}
}

@JsonSerializable()
class ToolboxListData {
  final dynamic createBy;
  final dynamic createTime;
  final dynamic updateBy;
  final dynamic updateTime;
  final dynamic remark;
  final String catalogueId;
  final String name;
  final int orderNum;

  ToolboxListData({
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
    required this.catalogueId,
    required this.name,
    required this.orderNum,
  });

  factory ToolboxListData.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  ToolboxListData toJson() => _$DataFromJson(this as Map<String, dynamic>);
}
