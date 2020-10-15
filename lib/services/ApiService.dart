import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ImpalaAdmin/New Models/Place.dart';
import 'package:ImpalaAdmin/services/ConversionService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ImpalaAdmin/New Models/PlaceEditingData.dart';
import 'package:ImpalaAdmin/New Models/HeadTags.dart';
import 'package:ImpalaAdmin/New Models/DescriptiveTag.dart';
import 'package:ImpalaAdmin/New Models/Rating.dart';
import 'package:ImpalaAdmin/New Models/TitleSuggestion.dart';
import 'package:ImpalaAdmin/New Models/BackgroundMediaSuggestion.dart';
import 'package:ImpalaAdmin/New Models/PlaceSnippet.dart';

class ApiService {
  CollectionReference placesReference =
      FirebaseFirestore.instance.collection('places');
  CollectionReference placeSnippetsReference =
      FirebaseFirestore.instance.collection('place_snippets');
  CollectionReference editingDataReference =
      FirebaseFirestore.instance.collection('editing_data');

  Future<List<Place>> createPlaces(
      {double latSouth,
      double lonWest,
      double latNorth,
      double lonEast}) async {
    String url =
        "http://projectnextdevwebapp.azurewebsites.net/api/create?latSouth=$latSouth&lonWest=$lonWest&latNorth=$latNorth&lonEast=$lonEast";

    var response = await http.get(url);
    List<Place> rawlist;
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      rawlist = ConversionService.mapListToPlaces(responseMap);
      List<Place> finalList = new List<Place>();
      rawlist.forEach((element) {
        Place place = element;
        place.snippet = addSnippet(element);
        place.editingData = addDummyEditData(element);
        finalList.add(place);
      });
      return finalList;
    }
  }

  Future insertPlace(Place place) async {
    DocumentReference placeDocumentReference;
    DocumentReference snippetDocumentReference;
    DocumentReference editingDataDocumentReference;

    try {
      placeDocumentReference =
          await placesReference.add(new Map<String, dynamic>());
      //Place ID matches document ID for simplicity
      place.placeId = placeDocumentReference.id;

      snippetDocumentReference =
          placeSnippetsReference.doc(placeDocumentReference.id);
      await snippetDocumentReference.set(place.snippet.toJson());

      editingDataDocumentReference =
          editingDataReference.doc(placeDocumentReference.id);
      await editingDataDocumentReference.set(place.editingData.toJson());

      await placeDocumentReference.set(place.toJson());
    } catch (e) {
      print(e);
      throw new Exception();
    }
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
}
