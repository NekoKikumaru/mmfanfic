import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mmfanfic/model/favorite.dart';
import 'package:mmfanfic/model/response.dart';

import 'package:mmfanfic/model/tag.dart';
import 'package:mmfanfic/model/fanfic.dart';
import 'package:mmfanfic/model/fandom.dart';

import '../web_services/base_api.dart';

class ApiImpl implements BaseApi {
  
  @override
  Future<List<Fanfic>> getFanfics() async {
    final response = await http.get(base_url+fanfic_path);
    List<dynamic> jsonObject = json.decode(response.body);
    List<Fanfic> fanfics = jsonObject.map((model) => Fanfic.fromJson(model)).toList(); 
    return fanfics;
  }
  
  @override
  Future<List<Fandom>> getFandoms() {
  }

  @override
  Future<List<Tag>> getTags() {
  }

  @override
  Future<Favorite> getFavorite(int fid, int uid) async {
    final response = await http.get(base_url+favorite_path+"?fid="+fid.toString()+"&uid="+uid.toString());
    if (response.body != "") {
      Map<String, dynamic> jsonObject = json.decode(response.body);
      Favorite favorite = Favorite.fromJson(jsonObject);
      return favorite;
      // return Stream.fromFuture(favorite);
      // yield* Stream.periodic(Duration(seconds: 1), (_) => favorite);
    }
    return null;
  }

  @override
  Stream<Favorite> getFavoriteStream(int fid, int uid) async* {
    yield await getFavorite(fid, uid);
  }

  @override
  Future<Response> toggleFavorite(int fid, int uid) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post(base_url+favorite_path+"?fid="+fid.toString()+"&uid="+uid.toString(), headers: headers);
    dynamic jsonObject = json.decode(response.body);
    Response res = jsonObject.map((model) => Response.fromJson(model));
    return res;
  }
}