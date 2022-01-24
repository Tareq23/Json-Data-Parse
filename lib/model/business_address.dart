

class BusinessAddressModel
{
  String? street;
  String? city;
  String? zipcode;
  BusinessAddressModel({this.street,this.city,this.zipcode});

  BusinessAddressModel.fromJson(Map<String,dynamic>parsedJson)
  {
    street = parsedJson['street'];
    city = parsedJson['city'];
    zipcode = parsedJson['zipcode'];
  }

}