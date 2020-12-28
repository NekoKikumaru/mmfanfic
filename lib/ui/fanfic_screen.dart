import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mmfanfic/business_logic/web_services/api_implementation.dart';
import 'package:mmfanfic/model/fanfic.dart';
import 'package:mmfanfic/model/favorite.dart';
import 'package:mmfanfic/utils/ui_helper.dart';
import 'package:provider/provider.dart';

class FanficScreen extends StatefulWidget {
  final Fanfic fanfic;
  final int uid = 2;

  FanficScreen({this.fanfic});

  @override
  State<StatefulWidget> createState() {
    return _FanficScreen(fanfic: fanfic, uid: uid);
  }
}

class _FanficScreen extends State<FanficScreen> {
  final Fanfic fanfic;
  final int uid;

  _FanficScreen({this.fanfic, this.uid});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      // FutureProvider<Favorite>(create: (context) => ApiImpl().getFavorite(fanfic.id, uid))
      StreamProvider<Favorite>(create: (context) => ApiImpl().getFavoriteStream(fanfic.id, uid), updateShouldNotify: (_, __) => true)
    ],
    child: Scaffold(
      appBar: (uid == fanfic.user.id)
      ? AppBar(title: Text(fanfic.title))
      : AppBar(
        title: Text(fanfic.title),
        actions: <Widget>[
          Consumer<Favorite>(
            builder: (context, favorite, widget) {
              Color favColor = Colors.white;
              if (favorite == null) {
                favColor = Colors.white;
              }
              else {
                favColor = Colors.red;
              }
              return IconButton(
                icon: Icon(Icons.favorite, color: favColor),
                onPressed: () async {
                  await http.post("http://192.168.99.24:8000/api/favorite?fid="+fanfic.id.toString()+"&uid="+uid.toString(), headers: {"Content-type": "application/json"});
                }
              );
              // return StreamBuilder<Favorite>(
              //   stream: Stream.periodic(Duration(seconds: 1), (fav) => favorite),
              //   builder: (context, snapshot) {
              //     Color favColor = Colors.white;
              //     if (favorite != null) {
              //       favColor = Colors.red;
              //     }
              //     return IconButton(
              //       icon: Icon(Icons.favorite, color: favColor),
              //       onPressed: () async {
              //         await http.post("http://192.168.99.24:8000/api/favorite?fid="+fanfic.id.toString()+"&uid="+uid.toString(), headers: {"Content-type": "application/json"});
              //       }
              //     );
              //   }
              // );
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UIHelper().largeMargin,
            Image.network(fanfic.cover, height: UIHelper().imgHeight),
            Text(fanfic.title, style: UIHelper().defaultTitle),
            Text(fanfic.description, style: UIHelper().defaultText)
          ],
        )
      )
    ));
  }
}