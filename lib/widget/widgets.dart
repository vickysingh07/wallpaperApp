import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/image_views.dart';

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
    padding: EdgeInsets.symmetric(horizontal: 14),
    child: GridView.count(crossAxisCount: 2,
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    childAspectRatio: 0.63,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers.map((wallpaper){
    return GridTile(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(
            imgUrl: wallpaper.src.portrait,
          )));
        },
        child: Hero(
          tag: wallpaper.src.portrait,
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)),
          ),
        ),
      ),
    );
    }).toList(),
    ),
  );
}