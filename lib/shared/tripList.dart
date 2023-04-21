import 'package:flutter/material.dart';
import 'package:new_tools/screens/details.dart';
import 'package:new_tools/models/trips.dart';

class TripList extends StatefulWidget {
  const TripList({Key? key}) : super(key: key);

  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> tripTiles = [];
  final GlobalKey listKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    addTrips();
  }

  void addTrips() {
    List<Trips> trips = [
      Trips(title:'Beach Paradise' ,price:'350' ,nights:'3' ,img:'lolly.jpg' ),
      Trips(title:'City Break' ,price:'400' ,nights:'5' ,img:'kazy.jpg' ),
      Trips(title:'Ski Adventure' ,price:'750' ,nights: '2',img:'house .jpg' ),
      Trips(title:'Space Blast' ,price:'600' ,nights:'4' ,img:'actors-wallpapers.jpg' ),
    ];
    trips.forEach((Trips trip) {
      tripTiles.add(buildTile(trip));
    });
  }

  Widget buildTile(Trips trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text('${trip.nights} nights',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color:  Colors.blue
          )
          ),
          Text(trip.title,
          style:  TextStyle(
            fontSize: 20,
            color: Colors.grey[600]
          ),)
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location${trip.img}',
          child: Image.asset(
              'images/${trip.img}',
              height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: listKey,
        itemCount: tripTiles.length,
        itemBuilder: (context, index) {
          return tripTiles[index];
        }
    );
  }
}
