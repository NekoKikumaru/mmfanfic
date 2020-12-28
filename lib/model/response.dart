class Response {
  int statusCode;
  String exception;

  Response({this.statusCode, this.exception});

  Response.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['exception'] = this.exception;
    return data;
  }
}