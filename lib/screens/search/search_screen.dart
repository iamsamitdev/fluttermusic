import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'ค้นหา',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search,color: Colors.black,size: 28.0,),
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Find your music",
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(12),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                      child: const Text("Pop Music",style: TextStyle(

                        fontSize: 20
                      ),),
                      color: Colors.deepOrange,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                      child: const Text("Rock",style: TextStyle(
                        fontSize: 20
                      ),),
                      color: Colors.deepPurple,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                      child: const Text("Hip Hop",style: TextStyle(
                        fontSize: 20
                      ),),
                      color: Colors.blueAccent,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                      child: const Text("Jazz",style: TextStyle(
                        fontSize: 20
                      ),),
                      color: Colors.amber,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                      child: const Text("House",style: TextStyle(
                        fontSize: 20
                      ),),
                      color: Colors.green,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                      child: const Text("Reggae",style: TextStyle(
                        fontSize: 20
                      ),),
                      color: Colors.red,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}