import 'package:flutter/material.dart';
import 'package:new_tools/shared/screenTitle.dart';
import 'package:new_tools/shared/tripList.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/seven.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft
          )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 36,),

            SizedBox(height: 160,
            child: ScreenTitle(text: 'NINJA TRIPS',

            ),
            ),
            Flexible(
              child: TripList(),
            )
          ],
        ),
      )
      
    );
  }
}
