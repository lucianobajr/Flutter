import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 7.0,bottom: PreferredSize(child: Container(color: Colors.black, height: 0.125,),
          preferredSize: Size.fromHeight(4.0),
      ),
        title: Text("Scaffold-Andaime",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor:Color.fromARGB(255,70,205,207) ,

        actions: <Widget>[
          IconButton(icon: new  Icon(Icons.accessible), onPressed: () => debugPrint("Tá Bão"))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255,255,255),
      body:Container(
        alignment: Alignment.center,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),

        bottomNavigationBar: BottomNavigationBar(
        items: [
           BottomNavigationBarItem(icon: Icon(Icons.all_inclusive,
             color: Color.fromARGB(255, 255, 255, 255)
           ),
               title:Text(""),
           ),
           BottomNavigationBarItem(icon: Icon(Icons.laptop_chromebook,
             color: Color.fromARGB(255, 255, 255, 255),

           ),
               title:Text(""),
           ),
        ],
          backgroundColor: Color.fromARGB(230,70,205,207),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(230,70,205,207),
        child: Icon(Icons.add),
      ),
    );
  }
}

