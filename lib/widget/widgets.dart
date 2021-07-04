import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';

Widget brandName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
children: [
  Text("Wallpaper", style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.black
  ),),
  Text("Hub",
  style: TextStyle(
  fontWeight: FontWeight.bold,
    color: Colors.blue,
    fontSize: 22
  ),)
      ]);
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: 0.6,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers.map((wallpaper){
    return GridTile(
      child: Container(
        child: Image.network(wallpaper.src.portrait),
      ),
    );
    }).toList(),
    ),
  );
}