import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  int total;
  int totalHits;
  List<dynamic> hits;

  ImageModel({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
