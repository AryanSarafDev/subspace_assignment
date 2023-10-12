import 'package:subspace_assignment/models/blog_model.dart';

class BlogList {
  List<Blogs>? BlogsList;
  BlogList({this.BlogsList});
  BlogList.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      BlogsList = <Blogs>[];
      json['blogs'].forEach((v) {
        BlogsList!.add(Blogs.fromJson(v));
      });
    }
  }
}

class Blogs {
  String? id;
  String? imageUrl;
  String? title;

  Blogs({this.id, this.imageUrl, this.title});

  factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
        id: json['id'],
        imageUrl: json['image_url'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_url': imageUrl,
        'title': title,
      };
}
