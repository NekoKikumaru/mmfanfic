class Fandom {
  int id;
  String name;
  Fandom root;
  int statusCode;
  int count;
  int status;
  String createdAt;
  String updatedAt;

  Fandom({
    this.id,
    this.name,
    this.root,
    this.statusCode,
    this.count,
    this.status,
    this.createdAt,
    this.updatedAt
  });

  Fandom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    root = json['root'] != null ? new Fandom.fromJson(json['root']) : null;
    statusCode = json['status_code'];
    count = json['count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.root != null) {
      data['root'] = this.root.toJson();
    }
    data['status_code'] = this.statusCode;
    data['count'] = this.count;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
