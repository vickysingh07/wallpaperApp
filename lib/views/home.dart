import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/categorie.dart';
import 'package:wallpaper_app/views/search.dart';
import 'package:wallpaper_app/widget/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/views/image_views.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String apiKEY = "563492ad6f91700001000001be08095f42954b3f95dfd068e19c7ef8";
  // ignore: deprecated_member_use
  List<CategoriesModel> categories = List();
  // ignore: deprecated_member_use
  List<WallpaperModel> wallpapers = List();

  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async{
    var response = await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=30&page=1'),
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
    getTrendingWallpapers();
    categories = getCategories();
    // TODO: implement initState
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
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(20)
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search Wallpaper",
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
    searchQuery: searchController.text,
    )));
    },
                        child: Container(child: Icon(Icons.search))
                    )],
                ),
              ),
              SizedBox(height:16),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Made By ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16),),
                    Text("Vicky Singh ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),),
                    Icon(MdiIcons.heart,
                    color: Colors.red,)
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                    itemBuilder: (context, index){
                  return CategoriesTile(imgUrl: categories[index].imgUrl, title: categories[index].categoriesName);
                }),
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  CategoriesTile({@required this.imgUrl,@required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesScreen(
          categorieName: title.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imgUrl, height: 60, width: 120,fit: BoxFit.cover,),
            ),
            Container(
              alignment: Alignment.center,
              height: 60, width: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(title,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),),
            )
          ])),
    );
  }
}
