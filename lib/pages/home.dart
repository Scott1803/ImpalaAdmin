import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:ImpalaAdmin/widgets/Starrating.dart';
import 'package:ImpalaAdmin/Models/Place.dart';
import 'package:ImpalaAdmin/Models/Adress.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final String mapStyle = """
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0d0d0d"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]
""";

  List<String> steps = [
    "Select Most South-Western Point",
    "Select most North-Eastern Point",
  ];

  int currentStep = 0;
  List<Place> places;
  Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          backgroundColor: Colors.grey[850],
          elevation: 7.0,
          title: new RichText(
              text: new TextSpan(children: [
            new TextSpan(
                text: "Impala ",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0)),
            new TextSpan(
                text: "Administration",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
          ])),
          centerTitle: true,
        ),
        body: new Stack(
          children: [
            new GoogleMap(
              initialPosition: new GeoCoord(49.865994, 8.661222),
              markers: markers,
              mapStyle: mapStyle,
            ),
            new Align(
                alignment: Alignment.bottomRight,
                child: new SpeedDial(
                  animatedIcon: AnimatedIcons.menu_close,
                  marginBottom: 50.0,
                  marginRight: 50.0,
                  overlayColor: Colors.grey[900],
                  backgroundColor: Colors.redAccent[700],
                  children: [
                    new SpeedDialChild(
                      backgroundColor: Colors.redAccent,
                      child: new Icon(MdiIcons.plusBoxOutline),
                      label: "Add Individual",
                      onTap: showSingleEntryScreen,
                    ),
                    new SpeedDialChild(
                        backgroundColor: Colors.redAccent,
                        child: new Icon(MdiIcons.plusBoxMultipleOutline),
                        label: "Add Multiple")
                  ],
                )),
          ],
        ));
  }

  Set<Marker> getMarkers(List<Place> places) {
    Set<Marker> markers = new Set<Marker>();
    places.forEach((element) {
      markers.add(new Marker(
        new GeoCoord(element.latitude, element.longitude),
        info: element.placeId.toString(),
        icon: "lib/assets/map_marker_small.png",
        onTap: (value) => showPlaceCard(context, value),
      ));
    });
    return markers;
  }

  List<Place> getPlaces() {
    List<Place> places = [
      new Place(
          placeId: 0,
          title: "Dreiklang",
          adress: new Adress(
              adressId: 0,
              city: "Darmstadt",
              country: "DE",
              houseNumber: "12b",
              postCode: "64285",
              streetName: "Karlstraße"),
          adressId: 0,
          averageUserrating: 4.2,
          contactEmail: "info@sitte-darmstadt.de",
          descriptorArrays: null,
          imageUrl: "lib/assets/images/dreiklang.jpg",
          latitude: 49.880710,
          longitude: 8.661278),
      new Place(
          placeId: 1,
          title: "Sitte",
          adress: new Adress(
              adressId: 0,
              city: "Darmstadt",
              country: "DE",
              houseNumber: "12b",
              postCode: "64285",
              streetName: "Karlstraße"),
          adressId: 0,
          averageUserrating: 4.2,
          contactEmail: "info@sitte-darmstadt.de",
          descriptorArrays: null,
          imageUrl: "lib/assets/images/sitte.jpg",
          latitude: 49.869516,
          longitude: 8.656309),
      new Place(
          placeId: 2,
          title: "Lahore Palace",
          adress: new Adress(
              adressId: 0,
              city: "Darmstadt",
              country: "DE",
              houseNumber: "12b",
              postCode: "64285",
              streetName: "Karlstraße"),
          adressId: 0,
          averageUserrating: 4.2,
          contactEmail: "info@sitte-darmstadt.de",
          descriptorArrays: null,
          imageUrl: "lib/assets/images/lahorepalace.jpg",
          latitude: 49.865663,
          longitude: 8.645714),
      new Place(
          placeId: 3,
          title: "Wellnitz",
          adress: new Adress(
              adressId: 0,
              city: "Darmstadt",
              country: "DE",
              houseNumber: "12b",
              postCode: "64285",
              streetName: "Karlstraße"),
          adressId: 0,
          averageUserrating: 4.2,
          contactEmail: "info@sitte-darmstadt.de",
          descriptorArrays: null,
          imageUrl: "lib/assets/images/sitte.jpg",
          latitude: 49.877737,
          longitude: 8.657380),
    ];
    return places;
  }

  void showPlaceCard(BuildContext context, String info) {
    Marker marker = findMarker(info);
    Place place = places
        .firstWhere((element) => element.placeId == int.tryParse(marker.info));
    showDialog(
      context: context,
      child: new Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: new Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Colors.grey[850],
            ),
            child: new Scaffold(
              backgroundColor: Colors.grey[850],
              appBar: new AppBar(
                backgroundColor: Colors.grey[850],
                title: new Text(place.title),
                leading: new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: new CustomScrollView(
                slivers: [
                  new SliverToBoxAdapter(
                    child: new Column(
                      children: [
                        new Text(place.title),
                        new Starrating(
                          rating: place.averageUserrating.toInt(),
                        ),
                        new Text(
                            "${place.adress.streetName} ${place.adress.houseNumber}"),
                        new Text(
                            "${place.adress.postCode} ${place.adress.city}"),
                        new Text(place.adress.country),
                        new Text("latitude: ${place.latitude}"),
                        new Text("longitude: ${place.longitude}"),
                        new Container(
                          width: 270.0,
                          height: 480.0,
                          child: new Image.asset(
                            place.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void showSingleEntryScreen() {
    Navigator.maybePop(context);
    showDialog(
      context: context,
      child: new Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          child: new Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Colors.grey[850],
            ),
            child: new Scaffold(
              backgroundColor: Colors.grey[850],
              appBar: new AppBar(
                backgroundColor: Colors.grey[850],
                title: new Text("Add Single Place"),
                leading: new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: new CustomScrollView(
                slivers: [
                  new SliverToBoxAdapter(
                    child: new Column(
                      children: [
                        new TextField(
                          decoration: new InputDecoration(hintText: "Name"),
                        ),
                        new TextField(
                          decoration: new InputDecoration(hintText: "Straße"),
                        ),
                        new TextField(
                          decoration:
                              new InputDecoration(hintText: "Hausnummer"),
                        ),
                        new TextField(
                          decoration:
                              new InputDecoration(hintText: "Postleitzahl"),
                        ),
                        new TextField(
                          decoration: new InputDecoration(hintText: "Stadt"),
                        ),
                        new TextField(
                          decoration:
                              new InputDecoration(hintText: "Ländercode"),
                        ),
                        new TextField(
                          decoration: new InputDecoration(hintText: "Lat"),
                        ),
                        new TextField(
                          decoration: new InputDecoration(hintText: "Lon"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Marker findMarker(String info) {
    List<String> coordsText = info
        .split('(')
        .last
        .characters
        .replaceFirst(Characters(")"), Characters(" "))
        .toString()
        .split(',');
    double lat = double.tryParse(coordsText.first.trim());
    double lon = double.tryParse(coordsText.last.trim());

    GeoCoord coordinates = new GeoCoord(lat, lon);

    Marker marker =
        markers.firstWhere((element) => element.position == coordinates);
    return marker;
  }

  @override
  void initState() {
    super.initState();
    places = getPlaces();
    markers = getMarkers(places);
  }
}
