import 'package:mmfanfic/model/fandom.dart';
import 'package:mmfanfic/model/fanfic.dart';
import 'package:mmfanfic/model/favorite.dart';
import 'package:mmfanfic/model/response.dart';
import 'package:mmfanfic/model/tag.dart';

const base_url = "http://192.168.99.24:8000/api/";
const fanfic_path = "fanfic/";
const fandom_path = "fandom/";
const favorite_path = "favorite/";
const tag_path = "tag/";

abstract class BaseApi {
  // Future<Fanfic> getFanfic(int id);
  Future<List<Fanfic>> getFanfics();
  // Future<Fandom> getFandom(int id);
  Future<List<Fandom>> getFandoms();
  // Future<Tag> getTag(int id);
  Future<List<Tag>> getTags();
  Future<Favorite> getFavorite(int fid, int uid);
  Stream<Favorite> getFavoriteStream(int fid, int uid);
  Future<Response> toggleFavorite(int fid, int uid);
}