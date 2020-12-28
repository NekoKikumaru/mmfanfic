class User {
  int id;
  String avatar;
  String name;
  String email;
  int status;
  int works;
  int favorites;
  int followers;
  int following;
  String createdAt;
  String updatedAt;

  User({
    this.id,
    this.avatar,
    this.name,
    this.email,
    this.status,
    this.works,
    this.favorites,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    works = json['works'];
    favorites = json['favorites'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['works'] = this.works;
    data['favorites'] = this.favorites;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}