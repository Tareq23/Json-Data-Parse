

class HomeAddressModel{
  String? street;
  String? city;
  String? zipcode;
  HomeAddressModel({this.street,this.city,this.zipcode});

  HomeAddressModel.fromJson(Map<String,dynamic>parsedJson)
  {
    street = parsedJson['street'];
    city = parsedJson['city'];
    zipcode = parsedJson['zipcode'];
  }

}