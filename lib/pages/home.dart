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
              markers: {
                Marker(
                  GeoCoord(34.0469058, -118.3503948),
                  icon: "lib/assets/map_marker_small.png",
                ),
              },
              mapStyle: mapStyle,
            ),
            new Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  child: new ListView.builder(
                    itemCount: steps.length,
                    itemBuilder: (context, index) {
                      return new Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: new Text(
                          steps[index],
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: index == currentStep
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: index == currentStep
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: index == currentStep ? 20 : 17,
                          ),
                        ),
                      );
                    },
                  ),
                )),
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
}
