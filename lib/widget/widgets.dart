import 'package:flutter/material.dart';

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