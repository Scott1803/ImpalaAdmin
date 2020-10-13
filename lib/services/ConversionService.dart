import 'package:ImpalaAdmin/Models/Tags/TagPricepoint.dart';
import 'package:ImpalaAdmin/Models/Tags/TagStyle.dart';
import 'package:ImpalaAdmin/Models/Tags/TagType.dart';
import 'package:ImpalaAdmin/Models/Membership.dart';
import 'package:ImpalaAdmin/New Models/Adress.dart';
import 'package:ImpalaAdmin/Models/Place.dart';
import 'package:ImpalaAdmin/New Models/Payment.dart';

class ConversionService {
  static TagPricepoint mapToTagPricepoint(Map<String, dynamic> map) {
    if (map.containsKey("pricepoint_id")) {
      List<dynamic> mapValues = map.values.toList();
      TagPricepoint tag = TagPricepoint();

      tag.pricepointId = mapValues[0];
      tag.name = mapValues[1];

      return tag;
    } else {
      return null;
    }
  }

  static TagStyle mapToTagStyle(Map<String, dynamic> map) {
    if (map.containsKey("style_id")) {
      List<dynamic> mapValues = map.values.toList();
      TagStyle tag = TagStyle();

      tag.styleId = mapValues[0];
      tag.name = mapValues[1];

      return tag;
    } else {
      return null;
    }
  }

  static TagType mapToTagType(Map<String, dynamic> map) {
    if (map.containsKey("type_id")) {
      List<dynamic> mapValues = map.values.toList();
      TagType tag = TagType();

      tag.typeId = mapValues[0];
      tag.name = mapValues[1];

      return tag;
    } else {
      return null;
    }
  }

  static Membership mapToMembership(Map<String, dynamic> map) {
    if (map.containsKey("membership_id")) {
      List<dynamic> mapValues = map.values.toList();
      Membership membership = new Membership();

      membership.membershipId = mapValues[0];
      membership.name = mapValues[1];
      membership.price = mapValues[2];

      return membership;
    } else {
      return null;
    }
  }

  static Adress mapToAdress(Map<String, dynamic> map) {
    if (map.containsKey("adress_id")) {
      List<dynamic> mapValues = map.values.toList();
      Adress adress = new Adress();

      adress.adressId = mapValues[0];
      adress.streetName = mapValues[1];
      adress.houseNumber = mapValues[2];
      adress.postCode = mapValues[3];
      adress.city = mapValues[4];
      adress.country = mapValues[5];

      return adress;
    } else {
      return null;
    }
  }

  static Place mapToPlace(Map<String, dynamic> map) {
    if (map.containsKey("place_id")) //If map is a valid place object
    {
      List<dynamic> mapValues = map.values.toList();
      Place place = new Place();

      place.placeId = mapValues[0];
      place.placeString = mapValues[1];
      place.title = mapValues[2];
      place.descriptorArrayId = mapValues[3];
      place.tagTypeId = mapValues[4];
      place.tagStyleId = mapValues[5];
      place.tagPricepointId = mapValues[6];
      place.ecAccepted = mapValues[7];
      place.latitude = mapValues[8];
      place.longitude = mapValues[9];
      place.adressId = mapValues[10];
      place.websiteUrl = mapValues[11];
      place.imageUrl = mapValues[12];
      place.averageUserrating = mapValues[13];
      place.yelpId = mapValues[14];
      place.partnerId = mapValues[15];
      place.membershipPlanId = mapValues[16];
      place.contactEmail = mapValues[17];
      place.osmAmenity = mapValues[18];
      place.osmCuisine = mapValues[19];
      place.tagline = mapValues[20];
      place.adress = ConversionService.mapToAdress(mapValues[21]);
      place.membershipTypes = mapValues[23];
      place.partner = mapValues[24];
      place.tagsPricepoint =
          ConversionService.mapToTagPricepoint(mapValues[25]);
      place.tagsStyle = ConversionService.mapToTagStyle(mapValues[26]);
      place.tagsType = ConversionService.mapToTagType(mapValues[27]);

      return place;
    } else {
      return null;
    }
  }

  static List<Place> mapListToPlaces(List<dynamic> mapList) {
    List<Place> places = new List<Place>();

    for (Map<String, dynamic> map in mapList) {
      Place place = mapToPlace(map);
      places.add(place);
    }

    return places;
  }

  static Payment mapToPayment(Map<String, dynamic> map) {
    List<dynamic> mapValues = map.values.toList();
    Payment payment = new Payment();
    payment.name = mapValues[0];
    payment.accepted = mapValues[1];

    return payment;
  }
}
