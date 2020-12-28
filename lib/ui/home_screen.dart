import 'package:flutter/material.dart';
import 'package:mmfanfic/business_logic/web_services/api_implementation.dart';
import 'package:mmfanfic/model/fanfic.dart';
import 'package:mmfanfic/utils/ui_helper.dart';
import 'package:mmfanfic/utils/widgets_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Fanfic>>(
      create: (context) => ApiImpl().getFanfics(),
      child: Consumer<List<Fanfic>>(
        builder: (context, fanfics, widget) {
          return fanfics == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Padding(
              padding: UIHelper().defaultPadding,
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Most Popular', style: UIHelper().defaultTitle),
                  UIHelper().smallMargin,
                  WidgetHelper().home_list("popular", fanfics),
                  UIHelper().largeMargin,
                  Text('Latest Updates', style: UIHelper().defaultTitle),
                  UIHelper().smallMargin,
                  WidgetHelper().home_list("updates",fanfics),
                  UIHelper().largeMargin
                ]
              )
            )
          );
        }
      )
    );
  }
}