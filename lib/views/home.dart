import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/widget/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use
  List<CategoriesModel> categories = List();
  @override
  void initState() {
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
      body: Container(
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
                      decoration: InputDecoration(
                        hintText: "Search Wallpaper",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("Can't Search now");
                    },
                      child: Icon(Icons.search))
                ],
              ),
            ),
            SizedBox(height:16),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Made For ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16),),
                  Text("Anshika Singh", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),)
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
            )
          ],
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
    return Container(
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
            child: Text(title,style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),),
          )
        ]));
  }
}
