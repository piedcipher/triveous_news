// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    sectionName: json['sectionName'] as String,
    webTitle: json['webTitle'] as String,
    webUrl: json['webUrl'] as String,
    fields: json['fields'] == null
        ? null
        : Fields.fromJson(json['fields'] as Map<String, dynamic>),
    webPublicationDate: json['webPublicationDate'] as String,
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'sectionName': instance.sectionName,
      'webTitle': instance.webTitle,
      'webUrl': instance.webUrl,
      'fields': instance.fields,
      'webPublicationDate': instance.webPublicationDate,
    };

Fields _$FieldsFromJson(Map<String, dynamic> json) {
  return Fields(
    thumbnail: json['thumbnail'] as String,
  );
}

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'thumbnail': instance.thumbnail,
    };
