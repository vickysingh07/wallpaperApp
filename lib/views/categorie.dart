import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widget/widgets.dart';
class CategoriesScreen extends StatefulWidget {
   final String categorieName;
   CategoriesScreen({this.categorieName});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  String apiKEY = "563492ad6f91700001000001be08095f42954b3f95dfd068e19c7ef8";
  // ignore: deprecated_member_use
  List<WallpaperModel> wallpapers = List();

  getSearchWallpapers(String searchQuery) async{
    var response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1'),
        headers: {
          "Authorization" : apiKEY
        });
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: brandName(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
