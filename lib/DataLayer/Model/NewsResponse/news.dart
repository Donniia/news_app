

import '../SourcesResponse/Source.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Joel Khalili"
/// title : "Peter Todd Was ‘Unmasked’ As Bitcoin Creator Satoshi Nakamoto. Now He’s In Hiding"
/// description : "Peter Todd has gone underground after an HBO documentary named him as the creator of Bitcoin, Satoshi Nakamoto, whose real identity has long remained a mystery."
/// url : "https://www.wired.com/story/peter-todd-was-unmasked-as-bitcoin-creator-satoshi-nakamoto-now-hes-in-hiding/"
/// urlToImage : "https://media.wired.com/photos/6716870e6874cb5feda0798e/191:100/w_1280,c_limit/102124-bitcoin-satoshi-an.jpg"
/// publishedAt : "2024-10-22T11:33:59Z"
/// content : "In the week before the documentary was released, online betting markets had Len Sassaman, a cryptographer who moved in similar online circles to Satoshi, as the most likely candidate to be revealed a… [+2075 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
News copyWith({  Source? source,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => News(  source: source ?? this.source,
  author: author ?? this.author,
  title: title ?? this.title,
  description: description ?? this.description,
  url: url ?? this.url,
  urlToImage: urlToImage ?? this.urlToImage,
  publishedAt: publishedAt ?? this.publishedAt,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}