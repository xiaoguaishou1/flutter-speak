/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-08 14:36:06
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-09 17:08:02
 * @FilePath: /speak/lib/apiResponse/stream_response.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

part 'stream_response.g.dart'; // 这是生成的文件，用于序列化

@JsonSerializable()
class StreamResponse {
  final String id;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage? usage;

  StreamResponse(
      {required this.id,
      required this.created,
      required this.model,
      required this.choices,
      this.usage});

  // 从JSON生成模型
  factory StreamResponse.fromJson(Map<String, dynamic> json) =>
      _$StreamResponseFromJson(json);

  // 将模型转换为JSON
  Map<String, dynamic> toJson() => _$StreamResponseToJson(this);
}

@JsonSerializable()
class Choice {
  final int index;
  final Delta? delta;

  Choice({required this.index, required this.delta});

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class Delta {
  final String role;
  final String? content;
  final String? finish_reason;
  Delta(this.finish_reason, {required this.role, required this.content});

  factory Delta.fromJson(Map<String, dynamic> json) => _$DeltaFromJson(json);

  Map<String, dynamic> toJson() => _$DeltaToJson(this);
}

@JsonSerializable()
class Usage {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;
  final int? prompt_tokens;
  final int? completion_tokens;
  final int? total_tokens;

  Usage(
      {required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens,
      required this.prompt_tokens,
      required this.completion_tokens,
      required this.total_tokens});

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}
