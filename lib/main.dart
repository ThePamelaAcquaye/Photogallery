import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photogallery/picture_detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhotoGalleryApp()
  ));
}

class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);

  @override
  _PhotoGalleryAppState createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  // Images data source
  List img =[
      "https://images.unsplash.com/photo-1545315003-c5ad6226c272?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80",
     "https://images.unsplash.com/photo-1629757509637-7c99379d6d26?ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MTh8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.pexels.com/photos/3571551/pexels-photo-3571551.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/2023384/pexels-photo-2023384.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1630157086556-bb93b2d8e395?ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MTJ8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.pexels.com/photos/1005417/pexels-photo-1005417.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1433052/pexels-photo-1433052.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/4577700/pexels-photo-4577700.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text("Photo Gallery App",
                style: TextStyle(
                fontSize: 32.0,
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),),
                SizedBox(height: 18.0,),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.amberAccent),
                        hintText: "Search for Image",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          )
                  ),
                ),
                SizedBox(height: 24.0,),
                Expanded(child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                        child: StaggeredGridView.countBuilder(
                            crossAxisCount:2 ,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            itemCount: img.length ,
                            itemBuilder: (context,index) {
                              return Container(
                              decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                              ),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>PictureDetailScreen(img[index])),);
                                  },
                                  child: ClipRRect(
                                     borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(img[index],fit: BoxFit.fill,),
                              ),
                                ),
                              );
                              },
                          staggeredTileBuilder: (index) {
                            return new StaggeredTile.count(1, index.isEven ? 1.2 :2);
                          })
                ),
                )],
            ),
          ),
       ),
     );
  }
}
