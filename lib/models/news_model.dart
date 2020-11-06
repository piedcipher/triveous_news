import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  String sectionName;
  String webTitle;
  String webUrl;
  Fields fields;

  NewsModel({
    this.sectionName,
    this.webTitle,
    this.webUrl,
    this.fields,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

@JsonSerializable()
class Fields {
  String thumbnail;

  Fields({
    this.thumbnail,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}
