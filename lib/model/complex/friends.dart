

class FriendModel
{
  String? name;
  String? email;
  String? address;
  FriendModel({this.name,this.email,this.address});

  FriendModel.fromJson(Map<String,dynamic>parsedJson)
  {
    name = parsedJson['name'];
    address = parsedJson['address'];
    email = parsedJson['email'];
  }

}