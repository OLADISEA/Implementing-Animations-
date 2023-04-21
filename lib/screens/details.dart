import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_tools/models/trips.dart';
import 'package:new_tools/shared/heart.dart';


class Details extends StatelessWidget {
  final Trips trip;
  Details({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: Hero(
                tag: 'location${trip.img}',
                child: Image.asset('images/${trip.img}',
                  height: 360,
                  fit:  BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                trip.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800]
                ),
              ),
              subtitle: Text('${trip.nights} night stay for only \$${trip.price}',
              style:  TextStyle(
                letterSpacing: 1
              ),),
              trailing: Heart(),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text('frfr fruji3 f fjijwdij fefjn  fijfij jrifjii efjkjri frmrim rififi',
                style: TextStyle(
                  color: Colors.grey[800],
                  height: 1.4
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
