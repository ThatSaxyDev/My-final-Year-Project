import 'dart:convert';

class NewsletterUpload {
  final List<String> newsletter;
  String? id;
  NewsletterUpload({
    required this.newsletter,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'newsletter': newsletter});
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory NewsletterUpload.fromMap(Map<String, dynamic> map) {
    return NewsletterUpload(
      newsletter: List<String>.from(map['newsletter']),
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsletterUpload.fromJson(String source) => NewsletterUpload.fromMap(json.decode(source));
}
