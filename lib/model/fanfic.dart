import 'package:mmfanfic/model/fandom.dart';
import 'package:mmfanfic/model/tag.dart';
import 'package:mmfanfic/model/user.dart';

class Fanfic {
  int id;
  String cover;
  String title;
  String description;
  User user;
  List<Fandom> fandom;
  List<Tag> tag;
  int chapters;
  int bookmarks;
  int favorites;
  int status;
  String createdAt;
  String updatedAt;

  Fanfic({
    this.id,
    this.cover,
    this.title,
    this.description,
    this.user,
    this.fandom,
    this.tag,
    this.chapters,
    this.bookmarks,
    this.favorites,
    this.status,
    this.createdAt,
    this.updatedAt
  });

  Fanfic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    title = json['title'];
    description = json['description'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['fandom'] != null) {
      fandom = new List<Fandom>();
      json['fandom'].forEach((v) {
        fandom.add(new Fandom.fromJson(v));
      });
    }
    if (json['tag'] != null) {
      tag = new List<Tag>();
      json['tag'].forEach((v) {
        tag.add(new Tag.fromJson(v));
      });
    }
    chapters = json['chapters'];
    bookmarks = json['bookmarks'];
    favorites = json['favorites'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.fandom != null) {
      data['fandom'] = this.fandom.map((v) => v.toJson()).toList();
    }
    if (this.tag != null) {
      data['tag'] = this.tag.map((v) => v.toJson()).toList();
    }
    data['chapters'] = this.chapters;
    data['bookmarks'] = this.bookmarks;
    data['favorites'] = this.favorites;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



