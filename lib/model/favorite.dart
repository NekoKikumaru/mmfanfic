class Favorite {
  int id;
  int fid;
  int uid;
  String createdAt;

  Favorite({this.id, this.fid, this.uid, this.createdAt});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fid = json['fid'];
    uid = json['uid'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fid'] = this.fid;
    data['uid'] = this.uid;
    data['created_at'] = this.createdAt;
    return data;
  }
}
