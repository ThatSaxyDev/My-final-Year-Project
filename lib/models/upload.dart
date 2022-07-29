import 'dart:convert';

class ImageUpload {
  final List<String> image;
  String? id;
  ImageUpload({
    required this.image,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'image': image});
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory ImageUpload.fromMap(Map<String, dynamic> map) {
    return ImageUpload(
      image: List<String>.from(map['image']),
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageUpload.fromJson(String source) => ImageUpload.fromMap(json.decode(source));
}
