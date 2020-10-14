import 'package:ImpalaAdmin/New%20Models/BackgroundMediaSuggestion.dart';
import 'package:ImpalaAdmin/New%20Models/DescriptiveTag.dart';
import 'package:ImpalaAdmin/New%20Models/HeadTags.dart';
import 'package:ImpalaAdmin/New%20Models/PlaceEditingData.dart';
import 'package:ImpalaAdmin/New%20Models/PlaceSnippet.dart';
import 'package:ImpalaAdmin/New%20Models/Rating.dart';
import 'package:ImpalaAdmin/New%20Models/TitleSuggestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ImpalaAdmin/services/ApiService.dart';
import 'package:ImpalaAdmin/New Models/Place.dart';
import 'package:ImpalaAdmin/widgets/Starrating.dart';

class MultipleEntries extends StatefulWidget {
  MultipleEntries({Key key}) : super(key: key);

  @override
  _MultipleEntriesState createState() => _MultipleEntriesState();
}

class _MultipleEntriesState extends State<MultipleEntries> {
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

  ApiService _service = new ApiService();

  String pageTitle;
  Widget floatingActionChild;
  Set<Marker> mapMarkers;

  List<String> steps = [
    "Select the most South-Western point.",
    "Select the most North-Eastern point."
  ];
  bool stepsVisible;

  int currentStep;
  GlobalKey<GoogleMapStateBase> _mapKey = new GlobalKey<GoogleMapStateBase>();

  GeoCoord firstCoordinates;
  GeoCoord lastCoordinates;

  List<Place> places;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 7.0,
        title: new Text(
          pageTitle,
          style: new TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        centerTitle: true,
        actions: [
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: new TextButton.icon(
                onPressed: undoClicked,
                icon: new Icon(
                  MdiIcons.undoVariant,
                  color: Colors.white,
                ),
                label: new Text(
                  "Undo",
                  style: new TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
      body: new Container(
          child: new Stack(
        children: [
          new GoogleMap(
            key: _mapKey,
            initialPosition: new GeoCoord(49.865994, 8.661222),
            mapStyle: mapStyle,
            markers: mapMarkers,
            onTap: (value) {
              if (currentStep == 0) {
                firstCoordinate(value);
              } else if (currentStep == 1) {
                lastCoordinate(value);
              }
            },
          ),
          new Align(
              alignment: Alignment.topCenter,
              child: new Visibility(
                visible: stepsVisible,
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
                            fontWeight: currentStep == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: currentStep == index ? 20.0 : 17.0,
                            color: currentStep == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )),
          new Align(
              alignment: Alignment.bottomRight,
              child: new Padding(
                padding: EdgeInsets.all(40.0),
                child: new FloatingActionButton(
                  backgroundColor: Colors.redAccent[700],
                  child: floatingActionChild,
                  onPressed: confirmClicked,
                ),
              ))
        ],
      )),
    );
  }

  void firstCoordinate(GeoCoord coordinates) {
    GoogleMap.of(_mapKey).addMarker(
        new Marker(coordinates, icon: "lib/assets/start_marker.png"));
    firstCoordinates = coordinates;
    setState(() {
      currentStep++;
    });
  }

  void lastCoordinate(GeoCoord coordinates) {
    lastCoordinates = coordinates;
    GeoCoord pointA = firstCoordinates;
    GeoCoord pointB = lastCoordinates;
    GeoCoord pointC =
        new GeoCoord(firstCoordinates.latitude, lastCoordinates.longitude);
    GeoCoord pointD =
        new GeoCoord(lastCoordinates.latitude, firstCoordinates.longitude);
    GoogleMap.of(_mapKey)
        .addMarker(new Marker(coordinates, icon: "lib/assets/stop_marker.png"));
    GoogleMap.of(_mapKey).addPolygon(
        "SelectedArea",
        [
          pointA,
          pointD,
          pointB,
          pointC,
        ],
        fillColor: Colors.green);
    setState(() {
      currentStep = -1;
      stepsVisible = false;
    });
  }

  void undoClicked() {
    firstCoordinates = null;
    lastCoordinates = null;
    GoogleMap.of(_mapKey).clearPolygons();
    GoogleMap.of(_mapKey).clearMarkers();
    setState(() {
      currentStep = 0;
      stepsVisible = true;
    });
  }

  Future confirmClicked() async {
    //Check if all values are valid, if not display popup and make user create entries again.
    if (places == null || places.length == 0) {
      setState(() {
        floatingActionChild = new Padding(
          padding: EdgeInsets.all(10.0),
          child: new CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
        pageTitle = "Retrieving Place Data...";
      });
      try {
        places = await _service.createPlaces(
            latSouth: firstCoordinates.latitude,
            lonWest: firstCoordinates.longitude,
            latNorth: lastCoordinates.latitude,
            lonEast: lastCoordinates.longitude);
      } catch (e) {
        places = null;
        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Error Retrieving Data"),
              content: new Text(
                  "Please try again. Make sure the area you are selecting is valied"),
              actions: [
                new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () => Navigator.pop(context))
              ],
            ));
      }
      GoogleMap.of(_mapKey).clearMarkers();
      GoogleMap.of(_mapKey).clearPolygons();
      places.forEach((place) {
        Marker marker = new Marker(
            new GeoCoord(place.latitude, place.longitude),
            icon: "lib/assets/map_marker_small.png",
            info: place.placeId.toString(),
            onTap: (info) => showPlaceCard(context, info));

        mapMarkers.add(marker);
        GoogleMap.of(_mapKey).addMarker(marker);
      });
      setState(() {
        floatingActionChild = new Icon(
          MdiIcons.uploadMultiple,
          color: Colors.white,
        );
        pageTitle = "Confirm Upload";
      });
    } else if (places != null && places.length > 0) {}
    //On click, add objects to firestore DB.
    await _service.insertPlace(places.first);
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
                centerTitle: true,
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
                          rating: place.rating.toInt(),
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
                            place.backgroundUrl,
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
        mapMarkers.firstWhere((element) => element.position == coordinates);
    return marker;
  }

  PlaceSnippet addSnippet(Place place) {
    PlaceSnippet snippet = new PlaceSnippet();
    snippet.placeId = place.placeId;
    snippet.title = place.title;
    snippet.rating = place.rating;
    snippet.adress = place.adress;
    snippet.latitude = place.latitude;
    snippet.longitude = place.longitude;
    snippet.thumnailUrl = place.thumnailUrl;
    snippet.headTags = place.headTags;
    snippet.descriptiveTags = place.descriptiveTags;
    return snippet;
  }

  PlaceEditingData addDummyEditData(Place place) {
    return new PlaceEditingData(
        titleSuggestions: [
          new TitleSuggestion(title: "Title 1", votes: 1, isSelected: false),
          new TitleSuggestion(title: "Title 2", votes: 3, isSelected: false),
        ],
        ratingData: new Rating(amount: 2, ratingsAbsolute: 8, ratingAverage: 4),
        headTags: [
          new HeadTag(name: "Restaurant", votesFalse: 2, votesTrue: 4),
          new HeadTag(name: "Schnell", votesFalse: 5, votesTrue: 1),
        ],
        backgroundMediaSuggestions: [
          new BackgroundMediaSuggestion(
              url: place.backgroundUrl, isSelected: true, votes: 2),
        ],
        descriptiveTagSuggestions: [
          new DescriptiveTag(name: "Italian", votes: 3),
          new DescriptiveTag(name: "Pasta", votes: 5),
        ]);
  }

  @override
  void initState() {
    super.initState();
    currentStep = 0;
    mapMarkers = {};
    stepsVisible = true;
    floatingActionChild = new Icon(
      Icons.done,
      color: Colors.white,
    );
    pageTitle = "Add Multiple Entries";
  }
}
