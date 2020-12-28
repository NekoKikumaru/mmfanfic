import 'package:flutter/material.dart';
import 'package:mmfanfic/model/fanfic.dart';
import 'package:mmfanfic/ui/fanfic_screen.dart';
import 'package:mmfanfic/utils/ui_helper.dart';

class WidgetHelper {
  Widget nav_icon(IconData icon) {
    return Icon(icon, size: 30, color: Colors.white);
  }

  Widget home_list(String type, List<Fanfic> fanfics) {
    return Container(
      height: 245,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fanfics.length,
        itemBuilder: (BuildContext context, int index) {
          return home_tile(context, type, fanfics[index]);
        }
      )
    );
  }

  Widget home_tile(BuildContext context, String type, Fanfic fanfic) {
    return InkWell(
      onTap: () {
        // Navigator.of(context, rootNavigator: true).pushNamed("/fanfic", arguments: fanfic);
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FanficScreen(fanfic: fanfic)));
      },
      child: Container(
        width: UIHelper().imgWidth,
        child: Card(
          child: Column(
            children: [
              Hero(
                tag: type+fanfic.id.toString(),
                child: Image.network(fanfic.cover, fit: BoxFit.fill)
              ),
              Padding(
                padding: UIHelper().textPadding,
                child: Text(fanfic.title, style: UIHelper().defaultText, maxLines: 1, overflow: TextOverflow.ellipsis)
              )
            ],
          ),
        ),
      )
    );
  }
}